#!/usr/bin/env python3

import os
import sys
import subprocess
import shlex
from os import path
from typing import *
from enum import IntEnum, Enum, auto
from dataclasses import dataclass
from copy import copy
from time import sleep
import traceback

PORTH_EXT = '.thrt'
DEFAULT_EXPANSION_LIMIT=1000
EXPANSION_DIAGNOSTIC_LIMIT=10
X86_64_RET_STACK_CAPACITY=4096

debug=False
Library=False

Loc=Tuple[str, int, int]

class Keyword(Enum):
    IF=auto()
    ELIF=auto()
    ELSE=auto()
    END=auto()
    WHILE=auto()
    DO=auto()
    MACRO=auto()
    INCLUDE=auto()
    MEMORY=auto()
    FUNCTION=auto()
    CONST=auto()
    OFFSET=auto()
    RESET=auto()
    ASSERT=auto()
    TRUE=auto()
    FALSE=auto()
    NULL=auto()
    AS=auto()
    RETURN=auto()
    EXTERN=auto()

class DataType(IntEnum):
    INT=auto()
    BOOL=auto()
    PTR=auto()

assert len(DataType) == 3, 'Exhaustive casts for all data types'
class Intrinsic(Enum):
    PLUS=auto()
    MINUS=auto()
    MUL=auto()
    DIV=auto()
    MOD=auto()
    DUP=auto()
    SWAP=auto()
    SWAP2=auto()
    OVER=auto()
    ROT=auto()
    PRINT=auto()
    EQ=auto()
    GT=auto()
    LT=auto()
    GE=auto()
    LE=auto()
    NE=auto()
    INV=auto()
    DROP=auto()
    LOAD=auto()
    LOAD16=auto()
    LOAD32=auto()
    LOAD64=auto()
    STORE=auto()
    STORE16=auto()
    STORE32=auto()
    STORE64=auto()
    SYSCALL0=auto()
    SYSCALL1=auto()
    SYSCALL2=auto()
    SYSCALL3=auto()
    SYSCALL4=auto()
    SYSCALL5=auto()
    SYSCALL6=auto()
    ARGC=auto()
    ARGV=auto()
    SHR=auto()
    SHL=auto()
    AND=auto()
    OR=auto()
    NOT=auto()
    XOR=auto()
    MAX=auto()
    MIN=auto()
    HERE=auto()
    CAST_PTR=auto()
    CAST_INT=auto()
    CAST_BOOL=auto()

class OpType(Enum):
    PUSH_BOOL=auto()
    PUSH_PTR=auto()
    PUSH_INT=auto()
    PUSH_STR=auto()
    PUSH_CSTR=auto()
    PUSH_MEM=auto()
    PUSH_LOCAL_MEM=auto()
    INTRINSIC=auto()
    IF=auto()
    ELIF=auto()
    ELSE=auto()
    END=auto()
    WHILE=auto()
    DO=auto()
    FUNCTION=auto()
    STACK_FRAME=auto()
    RETURN=auto()
    CALL=auto()

class TokenType(Enum):
    WORD=auto()
    INT=auto()
    STR=auto()
    CSTR=auto()
    CHAR=auto()
    KEYWORD=auto()

assert len(TokenType) == 6, "Exhaustive Token type definition. The `value` field of the Token dataclass may require an update"
@dataclass
class Token:
    typ: TokenType
    text: str
    loc: Loc
    value: Union[int, str, Keyword]
    # https://www.python.org/dev/peps/pep-0484/#forward-references
    expanded_from: Optional['Token'] = None
    expanded_count: int = 0

OpAddr=int
MemAddr=int

@dataclass
class Op:
    typ: OpType
    token: Token
    operand: Optional[Union[int, str, Intrinsic, OpAddr]] = None

@dataclass
class Program:
    ops: List[Op]
    memCapacity: int

def compiler_diagnostic(loc: Loc, tag: str, message: str):
    print("%s:%d:%d: %s: %s" % (loc + (tag, message)), file=sys.stderr)

def compiler_diagnostic_with_expansion_stack(token: Token, tag: str, message: str):
    compiler_diagnostic(token.loc, tag, message)
    stack = token.expanded_from
    limit = 0
    while stack is not None and limit <= EXPANSION_DIAGNOSTIC_LIMIT:
        compiler_note(stack.loc, "expanded from `%s`" % stack.text)
        stack = stack.expanded_from
        limit += 1
    if limit > EXPANSION_DIAGNOSTIC_LIMIT:
        print('...', file=sys.stderr)
        print('... too many expansions ...', file=sys.stderr)
        print('...', file=sys.stderr)

def compiler_error(loc: Loc, message: str):
    compiler_diagnostic(loc, 'ERROR', message)

def compiler_error_with_expansion_stack(token: Token, message: str):
    compiler_diagnostic_with_expansion_stack(token, 'ERROR', message)

def compiler_note(loc: Loc, message: str):
    compiler_diagnostic(loc, 'NOTE', message)

def not_enough_arguments(op: Op):
    if op.typ == OpType.INTRINSIC:
        assert isinstance(op.operand, Intrinsic)
        compiler_error_with_expansion_stack(op.token, "not enough arguments for the `%s` intrinsic" % INTRINSIC_NAMES[op.operand])
    # TODO: why don't we add while-do here too?
    elif op.typ == OpType.IF:
        compiler_error_with_expansion_stack(op.token, "not enough arguments for the if-block")
    else:
        assert False, "unsupported type of operation"

DataStack=List[Tuple[DataType, Token]]

@dataclass
class Context:
    stack: DataStack
    ip: OpAddr
    outs: List[DataType]

@dataclass
class Contract:
    ins: List[DataType]
    outs: List[DataType]

def type_check_contract(location: Token, ctx: Context, contract: Contract):
    ins = copy(contract.ins)
    while len(ctx.stack) > 0 and len(ins) > 0:
        actual, loc = ctx.stack.pop()
        expected = ins.pop()
        if actual != expected:
            compiler_error_with_expansion_stack(loc, f"Expected type {repr(expected)} but got {repr(actual)}")
            exit(1)
    if len(ctx.stack) < len(ins):
        compiler_error_with_expansion_stack(location, f"Not enought arguments provided. Expected:")
        for typ in ins:
            compiler_note(location.loc, f" {repr(typ)}")
        exit(1)
    ctx.stack += [(typ, location) for typ in contract.outs]

# TODO: better error reporting on type checking errors of intrinsics
# Reported expected and actual types with the location that introduced the actual type
def type_check_program(program: Program, contracts: Dict[str, Contract], extern):
    visited_dos: Dict[OpAddr, DataStack] = {}
    contexts: List[Context] = []
    if len(program.ops) == 0:
        exit(0);
    if not Library and contracts["main"][0].ins != [] and contracts["main"][0].outs != [DataType.INT]:
        compiler_error(Loc("main", 0, 0), "function main should have signature `fn main -> int`")
        exit(1)
    for fname, (fcontract, faddr) in reversed(contracts.items()):
        contexts.append(Context(stack=[(typ, program.ops[faddr].token) for typ in fcontract.ins], ip=faddr, outs=fcontract.outs))
    while len(contexts) > 0:
        ctx = contexts[-1]
        op = program.ops[ctx.ip]
        assert len(OpType) == 18, "Exhaustive ops handling in type_check_program()"
        if op.typ == OpType.PUSH_BOOL:
            ctx.stack.append((DataType.BOOL, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_PTR:
            ctx.stack.append((DataType.PTR, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_INT:
            ctx.stack.append((DataType.INT, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_STR:
            ctx.stack.append((DataType.INT, op.token))
            ctx.stack.append((DataType.PTR, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_CSTR:
            ctx.stack.append((DataType.PTR, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_MEM:
            ctx.stack.append((DataType.PTR, op.token))
            ctx.ip += 1
        elif op.typ == OpType.PUSH_LOCAL_MEM:
            ctx.stack.append((DataType.PTR, op.token))
            ctx.ip += 1
        elif op.typ == OpType.FUNCTION:
            ctx.ip += 1
        elif op.typ == OpType.STACK_FRAME:
            ctx.ip += 1
        elif op.typ == OpType.RETURN:
            if [typ for typ, _ in ctx.stack] != ctx.outs:
                compiler_error_with_expansion_stack(op.token, "Unexpected data on function stack")
                compiler_note(op.token.loc, f"Expected: {ctx.outs}")
                compiler_note(op.token.loc, f"Actual: ")
                for typ, tok in ctx.stack:
                    compiler_note(tok.loc, f"{repr(typ)}")
                exit(1)
            contexts.pop()
        elif op.typ == OpType.CALL:
            assert isinstance(op.operand, str)
            if op.operand in extern:
                type_check_contract(op.token, ctx, extern[op.operand])
            elif op.operand in contracts:
                type_check_contract(op.token, ctx, contracts[op.operand][0])
            else:
                compiler_error_with_expansion_stack(op.token, "Unknown Function: `%s`" % op.operand)
                exit(1)
            ctx.ip += 1
        elif op.typ == OpType.INTRINSIC:
            assert len(Intrinsic) == 48, "Exhaustive intrinsic handling in type_check_program()"
            assert isinstance(op.operand, Intrinsic), "This could be a bug in compilation step"
            if op.operand == Intrinsic.MIN:
                assert len(DataType) == 3, "Exhaustive type handling in PLUS intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()
                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types for MIN intrinsic. Expected INT")
                    exit(1)
            elif op.operand == Intrinsic.MAX:
                assert len(DataType) == 3, "Exhaustive type handling in PLUS intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()
                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types for MIN intrinsic. Expected INT")
                    exit(1)
            elif op.operand == Intrinsic.PLUS:
                assert len(DataType) == 3, "Exhaustive type handling in PLUS intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == DataType.INT and b_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                elif a_type == DataType.INT and b_type == DataType.PTR:
                    ctx.stack.append((DataType.PTR, op.token))
                elif a_type == DataType.PTR and b_type == DataType.INT:
                    ctx.stack.append((DataType.PTR, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types for PLUS intrinsic. Expected INT or PTR")
                    exit(1)
            elif op.operand == Intrinsic.MINUS:
                assert len(DataType) == 3, "Exhaustive type handling in MINUS intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and (a_type == DataType.INT or a_type == DataType.PTR):
                    ctx.stack.append((DataType.INT, op.token))
                elif b_type == DataType.PTR and a_type == DataType.INT:
                    ctx.stack.append((DataType.PTR, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types fo MINUS intrinsic: %s" % [b_type, a_type])
                    exit(1)
            elif op.operand == Intrinsic.MUL:
                assert len(DataType) == 3, "Exhaustive type handling in MUL intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types fo MUL intrinsic. Expected INT.")
                    exit(1)
            elif op.operand == Intrinsic.DIV:
                assert len(DataType) == 3, "Exhaustive type handling in DIVMOD intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types fo DIVMOD intrinsic. Expected INT.")
                    exit(1)
            elif op.operand == Intrinsic.MOD:
                assert len(DataType) == 3, "Exhaustive type handling in DIVMOD intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types fo MOD intrinsic. Expected INT.")
                    exit(1)
            elif op.operand == Intrinsic.EQ:
                assert len(DataType) == 3, "Exhaustive type handling in EQ intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument types fo EQ intrinsic. Expected INT.")
                    exit(1)
            elif op.operand == Intrinsic.GT:
                assert len(DataType) == 3, "Exhaustive type handling in GT intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for GT intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.LT:
                assert len(DataType) == 3, "Exhaustive type handling in LT intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LT intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.GE:
                assert len(DataType) == 3, "Exhaustive type handling in GE intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for GE intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.LE:
                assert len(DataType) == 3, "Exhaustive type handling in LE intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LE intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.NE:
                assert len(DataType) == 3, "Exhaustive type handling in NE intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for NE intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.SHR:
                assert len(DataType) == 3, "Exhaustive type handling in SHR intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for SHR intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.SHL:
                assert len(DataType) == 3, "Exhaustive type handling in SHL intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for SHL intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.OR:
                assert len(DataType) == 3, "Exhaustive type handling in OR intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                elif a_type == b_type and a_type == DataType.BOOL:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for OR intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.AND:
                assert len(DataType) == 3, "Exhaustive type handling in AND intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                elif a_type == b_type and a_type == DataType.BOOL:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for AND intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.XOR:
                assert len(DataType) == 3, "Exhaustive type handling in XOR intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if a_type == b_type and a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                elif a_type == b_type and a_type == DataType.BOOL:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for XOR intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.NOT:
                assert len(DataType) == 3, "Exhaustive type handling in NOT intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.INT:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for NOT intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.INV:
                assert len(DataType) == 3, "Exhaustive type handling in INV intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.BOOL:
                    ctx.stack.append((DataType.BOOL, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for INV intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.PRINT:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                ctx.stack.pop()
            elif op.operand == Intrinsic.DUP:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a = ctx.stack.pop()
                ctx.stack.append(a)
                ctx.stack.append(a)
            elif op.operand == Intrinsic.SWAP:
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a = ctx.stack.pop()
                b = ctx.stack.pop()
                ctx.stack.append(a)
                ctx.stack.append(b)
            elif op.operand == Intrinsic.SWAP2:
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a = ctx.stack.pop()
                b = ctx.stack.pop()
                c = ctx.stack.pop()
                d = ctx.stack.pop()
                ctx.stack.append(b)
                ctx.stack.append(a)
                ctx.stack.append(d)
                ctx.stack.append(c)
            elif op.operand == Intrinsic.DROP:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                ctx.stack.pop()
            elif op.operand == Intrinsic.OVER:
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                a = ctx.stack.pop()
                b = ctx.stack.pop()
                ctx.stack.append(b)
                ctx.stack.append(a)
                ctx.stack.append(b)
            elif op.operand == Intrinsic.ROT:
                if len(ctx.stack) < 3:
                    not_enough_arguments(op)
                    exit(1)
                a = ctx.stack.pop()
                b = ctx.stack.pop()
                c = ctx.stack.pop()
                ctx.stack.append(b)
                ctx.stack.append(a)
                ctx.stack.append(c)
            elif op.operand == Intrinsic.LOAD:
                assert len(DataType) == 3, "Exhaustive type handling in LOAD intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.PTR:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LOAD intrinsic: %s" % a_type)
                    exit(1)
            elif op.operand == Intrinsic.LOAD16:
                assert len(DataType) == 3, "Exhaustive type handling in LOAD16 intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.PTR:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LOAD16 intrinsic: %s" % a_type)
                    exit(1)
            elif op.operand == Intrinsic.LOAD32:
                assert len(DataType) == 3, "Exhaustive type handling in LOAD32 intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.PTR:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LOAD32 intrinsic: %s" % a_type)
                    exit(1)
            elif op.operand == Intrinsic.LOAD64:
                assert len(DataType) == 3, "Exhaustive type handling in LOAD64 intrinsic"
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                a_type, a_loc = ctx.stack.pop()

                if a_type == DataType.PTR:
                    ctx.stack.append((DataType.INT, op.token))
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for LOAD64 intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.STORE:
                assert len(DataType) == 3, "Exhaustive type handling in STORE intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if b_type == DataType.INT and a_type == DataType.PTR:
                    pass
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for STORE intrinsic got %s and %s" % (str(a_type), str(b_type)))   
                    exit(1)
            elif op.operand == Intrinsic.STORE16:
                assert len(DataType) == 3, "Exhaustive type handling in STORE16 intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if b_type == DataType.INT and a_type == DataType.PTR:
                    pass
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for STORE16 intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.STORE32:
                assert len(DataType) == 3, "Exhaustive type handling in STORE32 intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if b_type == DataType.INT and a_type == DataType.PTR:
                    pass
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for STORE32 intrinsic")
                    exit(1)
            elif op.operand == Intrinsic.STORE64:
                assert len(DataType) == 3, "Exhaustive type handling in STORE64 intrinsic"
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_loc = ctx.stack.pop()
                b_type, b_loc = ctx.stack.pop()

                if (b_type == DataType.INT or b_type == DataType.PTR) and a_type == DataType.PTR:
                    pass
                else:
                    compiler_error_with_expansion_stack(op.token, "invalid argument type for STORE64 intrinsic: %s" % [b_type, a_type])
                    exit(1)
            elif op.operand == Intrinsic.CAST_PTR:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_token = ctx.stack.pop()

                ctx.stack.append((DataType.PTR, a_token))
            elif op.operand == Intrinsic.CAST_INT:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_token = ctx.stack.pop()

                ctx.stack.append((DataType.INT, a_token))
            elif op.operand == Intrinsic.CAST_BOOL:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)

                a_type, a_token = ctx.stack.pop()

                ctx.stack.append((DataType.BOOL, a_token))
            elif op.operand == Intrinsic.ARGC:
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.ARGV:
                ctx.stack.append((DataType.PTR, op.token))
            elif op.operand == Intrinsic.HERE:
                ctx.stack.append((DataType.INT, op.token))
                ctx.stack.append((DataType.PTR, op.token))
            # TODO: figure out how to type check syscall arguments and return types
            elif op.operand == Intrinsic.SYSCALL0:
                if len(ctx.stack) < 1:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(1):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL1:
                if len(ctx.stack) < 2:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(2):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL2:
                if len(ctx.stack) < 3:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(3):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL3:
                if len(ctx.stack) < 4:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(4):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL4:
                if len(ctx.stack) < 5:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(5):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL5:
                if len(ctx.stack) < 6:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(6):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            elif op.operand == Intrinsic.SYSCALL6:
                if len(ctx.stack) < 7:
                    not_enough_arguments(op)
                    exit(1)
                for i in range(7):
                    ctx.stack.pop()
                ctx.stack.append((DataType.INT, op.token))
            else:
                print(op)
                assert False, "unreachable"
            ctx.ip += 1
        elif op.typ == OpType.IF:
            ctx.ip += 1
        elif op.typ == OpType.WHILE:
            ctx.ip += 1
        elif op.typ == OpType.END:
            assert isinstance(op.operand, OpAddr)
            ctx.ip = op.operand
        elif op.typ == OpType.ELSE:
            assert isinstance(op.operand, OpAddr)
            ctx.ip = op.operand
        elif op.typ == OpType.ELIF:
            assert isinstance(op.operand, OpAddr)
            ctx.ip = op.operand
        elif op.typ == OpType.DO:
            assert isinstance(op.operand, OpAddr)
            if len(ctx.stack) < 1:
                not_enough_arguments(op)
                exit(1)
            a_type, a_token = ctx.stack.pop()
            if a_type != DataType.BOOL:
                compiler_error_with_expansion_stack(op.token, "Invalid argument for the while-do condition. Expected BOOL.")
                exit(1)
            if ctx.ip in visited_dos:
                expected_types = list(map(lambda x: x[0], visited_dos[ctx.ip]))
                actual_types = list(map(lambda x: x[0], ctx.stack))
                if expected_types != actual_types:
                    print(ctx.stack)
                    compiler_error_with_expansion_stack(op.token, 'Loops are not allowed to alter types and amount of elements on the stack.')
                    compiler_note(op.token.loc, 'Expected elements: %s' % expected_types)
                    compiler_note(op.token.loc, 'Actual elements: %s' % actual_types)
                    exit(1)
                contexts.pop()
                if len(contexts) > 0:
                    ctx = contexts[-1]
                else:
                    continue
            else:
                visited_dos[ctx.ip] = copy(ctx.stack)
                ctx.ip += 1
                contexts.append(Context(stack=copy(ctx.stack), ip=op.operand, outs=copy(ctx.outs)))
                ctx = contexts[-1]
        else:
            assert False, "unreachable"

        if ctx.ip >= len(program.ops):
            if len(ctx.stack) != 0:
                compiler_error_with_expansion_stack(ctx.stack[-1][1], "unhandled data on the ctx.stack: %s" % list(map(lambda x: x[0], ctx.stack)))
                exit(1)
            contexts.pop()

def generate_nasm_linux_x86_64(program: Program, out_file_path: str, extern: List[str]):
    strs: List[bytes] = []
    with open(out_file_path, "w") as out:
        if Library:
            out.write("extern print\n")
        out.write("BITS 64\n")
        out.write("segment .text\n")
        if not Library:
            for n in extern:
                out.write("extern %s\n" % n)
            out.write("global print\n")
            out.write("print:\n")
            out.write("    mov     r9, -3689348814741910323\n")
            out.write("    sub     rsp, 40\n")
            out.write("    mov     BYTE [rsp+31], 10\n")
            out.write("    lea     rcx, [rsp+30]\n")
            out.write(".L2:\n")
            out.write("    mov     rax, rdi\n")
            out.write("    lea     r8, [rsp+32]\n")
            out.write("    mul     r9\n")
            out.write("    mov     rax, rdi\n")
            out.write("    sub     r8, rcx\n")
            out.write("    shr     rdx, 3\n")
            out.write("    lea     rsi, [rdx+rdx*4]\n")
            out.write("    add     rsi, rsi\n")
            out.write("    sub     rax, rsi\n")
            out.write("    add     eax, 48\n")
            out.write("    mov     BYTE [rcx], al\n")
            out.write("    mov     rax, rdi\n")
            out.write("    mov     rdi, rdx\n")
            out.write("    mov     rdx, rcx\n")
            out.write("    sub     rcx, 1\n")
            out.write("    cmp     rax, 9\n")
            out.write("    ja      .L2\n")
            out.write("    lea     rax, [rsp+32]\n")
            out.write("    mov     edi, 1\n")
            out.write("    sub     rdx, rax\n")
            out.write("    xor     eax, eax\n")
            out.write("    lea     rsi, [rsp+32+rdx]\n")
            out.write("    mov     rdx, r8\n")
            out.write("    mov     rax, 1\n")
            out.write("    syscall\n")
            out.write("    add     rsp, 40\n")
            out.write("    ret\n")
            out.write("global _start\n")
            out.write("_start:\n")
            out.write("    mov [args_ptr], rsp\n")
            out.write("    mov rax, ret_stack_end\n")
            out.write("    mov [ret_stack_rsp], rax\n")
            out.write("    mov rax, rsp\n")
            out.write("    mov rsp, [ret_stack_rsp]\n")
            out.write("    call main\n")
            out.write("    mov [ret_stack_rsp], rsp\n")
            out.write("    mov rsp, rax\n")
            out.write("    pop qword rdi\n")
            out.write("    mov rax, 60\n")
            out.write("    syscall\n")
        for ip in range(len(program.ops)):
            op = program.ops[ip]
            assert len(OpType) == 18, "Exhaustive ops handling in generate_nasm_linux_x86_64"
            if op.typ == OpType.PUSH_INT:
                assert isinstance(op.operand, int), "This could be a bug in the parsing step"
                out.write("    ;; -- push int %d --\n" % op.operand)
                out.write("    mov rax, %d\n" % op.operand)
                out.write("    push rax\n")
            elif op.typ == OpType.PUSH_BOOL:
                assert isinstance(op.operand, bool), "This could be a bug in the parsing step"
                out.write("    ;; -- push bool %d --\n" % int(op.operand))
                out.write("    mov rax, %d\n" % int(op.operand))
                out.write("    push rax\n")
            elif op.typ == OpType.PUSH_PTR:
                assert isinstance(op.operand, int), "This could be a bug in the parsing step"
                out.write("    ;; -- push ptr %d --\n" % op.operand)
                out.write("    mov rax, %d\n" % op.operand)
                out.write("    push rax\n")
            elif op.typ == OpType.PUSH_STR:
                assert isinstance(op.operand, str), "This could be a bug in the parsing step"
                value = op.operand.encode('utf-8')
                n = len(value)
                out.write("    ;; -- push str --\n")
                out.write("    mov rax, %d\n" % n)
                out.write("    push rax\n")
                out.write("    push str_%d\n" % len(strs))
                strs.append(value)
            elif op.typ == OpType.PUSH_CSTR:
                assert isinstance(op.operand, str), "This could be a bug in the parsing step"
                value = op.operand.encode('utf-8') + b'\0'
                out.write("    ;; -- push str --\n")
                out.write("    push str_%d\n" % len(strs))
                strs.append(value)
            elif op.typ == OpType.PUSH_MEM:
                assert isinstance(op.operand, MemAddr), "This could be a bug in the parsing step"
                out.write("    ;; -- push mem --\n")
                out.write("    mov rax, mem\n")
                out.write("    add rax, %d\n" % op.operand)
                out.write("    push rax\n")
            elif op.typ == OpType.PUSH_LOCAL_MEM:
                assert isinstance(op.operand, MemAddr)
                out.write("    mov rax, [ret_stack_rsp]\n")
                out.write("    add rax, %d\n" % op.operand)
                out.write("    push rax\n")
            elif op.typ == OpType.IF:
                out.write("    ;; -- if --\n")
            elif op.typ == OpType.WHILE:
                out.write("    ;; -- while --\n")
                out.write("addr_%d:\n" % ip)
            elif op.typ == OpType.ELSE:
                out.write("    ;; -- else --\n")
                assert isinstance(op.operand, OpAddr), "This could be a bug in the parsing step"
                out.write("    jmp addr_%d\n" % op.operand)
                out.write("addr_%s:\n" % (ip + 1))
            elif op.typ == OpType.ELIF:
                out.write("    ;; -- elif --\n")
                assert isinstance(op.operand, OpAddr), f"This could be a bug in the parsing step: {op.operand}"
                out.write("    jmp addr_%d\n" % op.operand)
                out.write("addr_%s:\n" % (ip + 1))
            elif op.typ == OpType.END:
                assert isinstance(op.operand, int), "This could be a bug in the parsing step"
                out.write("    ;; -- end --\n")
                if ip + 1 != op.operand:
                    out.write("    jmp addr_%d\n" % op.operand)
                out.write("addr_%d:\n" % (ip + 1))
            elif op.typ == OpType.DO:
                out.write("    ;; -- do --\n")
                out.write("    pop rax\n")
                out.write("    test rax, rax\n")
                assert isinstance(op.operand, int), "This could be a bug in the parsing step"
                out.write("    jz addr_%d\n" % op.operand)
            elif op.typ == OpType.FUNCTION:
                out.write("    ;; -- func --\n")
                assert isinstance(op.operand, str)
                out.write("global %s\n" % op.operand)
                out.write("%s:\n" % op.operand)
            elif op.typ == OpType.STACK_FRAME:
                assert isinstance(op.operand, int)
                out.write("    ;; -- stack prep --\n")
                if op.operand != 0:
                    out.write("    sub rsp, %d\n" % op.operand)
                out.write("    mov [ret_stack_rsp], rsp\n")
                out.write("    mov rsp, rax\n")
            elif op.typ == OpType.RETURN:
                assert isinstance(op.operand, int)
                out.write("    ;; -- return --\n")
                out.write("    mov rax, rsp\n")
                out.write("    mov rsp, [ret_stack_rsp]\n")
                if op.operand != 0:
                    out.write("    add rsp, %d\n" % op.operand)
                out.write("    ret\n")
            elif op.typ == OpType.CALL:
                out.write("    ;; -- call --\n")
                assert isinstance(op.operand, str), "This could be a bug in the parsing step"
                out.write("    mov rax, rsp\n")
                out.write("    mov rsp, [ret_stack_rsp]\n")
                out.write("    call %s\n" % op.operand)
                out.write("    mov [ret_stack_rsp], rsp\n")
                out.write("    mov rsp, rax\n")
            elif op.typ == OpType.INTRINSIC:
                assert len(Intrinsic) == 48, "Exhaustive intrinsic handling in generate_nasm_linux_x86_64()"
                if op.operand == Intrinsic.MIN:
                    out.write("    ;; -- min --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    cmp rax, rbx\n")
                    out.write("    cmovle rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.MAX:
                    out.write("    ;; -- min --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    cmp rax, rbx\n")
                    out.write("    cmovge rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.PLUS:
                    out.write("    ;; -- plus --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    add rax, rbx\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.MINUS:
                    out.write("    ;; -- minus --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    sub rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.MUL:
                    out.write("    ;; -- mul --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    mul rbx\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.DIV:
                    out.write(";   -- division --\n")
                    out.write("    xor rdx, rdx\n")
                    out.write("    pop rbx\n")
                    out.write("    pop rax\n")
                    out.write("    div rbx\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.MOD:
                    out.write(";   -- modulo --\n")
                    out.write("    xor rdx, rdx\n")
                    out.write("    pop rbx\n")
                    out.write("    pop rax\n")
                    out.write("    div rbx\n")
                    out.write("    push rdx\n")
                elif op.operand == Intrinsic.SHR:
                    out.write("    ;; -- shr --\n")
                    out.write("    pop rcx\n")
                    out.write("    pop rbx\n")
                    out.write("    shr rbx, cl\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.SHL:
                    out.write("    ;; -- shl --\n")
                    out.write("    pop rcx\n")
                    out.write("    pop rbx\n")
                    out.write("    shl rbx, cl\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.OR:
                    out.write("    ;; -- bor --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    or rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.AND:
                    out.write("    ;; -- band --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    and rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.AND:
                    out.write("    ;; -- bxor --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    xor rbx, rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.NOT:
                    out.write("    ;; -- not --\n")
                    out.write("    pop rax\n")
                    out.write("    not rax\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.PRINT:
                    out.write("    ;; -- print --\n")
                    out.write("    pop rdi\n")
                    out.write("    call print\n")
                elif op.operand == Intrinsic.INV:
                    out.write("    ;; -- inv --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rax\n");
                    out.write("    cmp rax, rcx\n");
                    out.write("    cmove rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.EQ:
                    out.write("    ;; -- equal --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rax\n");
                    out.write("    pop rbx\n");
                    out.write("    cmp rax, rbx\n");
                    out.write("    cmove rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.GT:
                    out.write("    ;; -- gt --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rbx\n");
                    out.write("    pop rax\n");
                    out.write("    cmp rax, rbx\n");
                    out.write("    cmovg rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.LT:
                    out.write("    ;; -- gt --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rbx\n");
                    out.write("    pop rax\n");
                    out.write("    cmp rax, rbx\n");
                    out.write("    cmovl rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.GE:
                    out.write("    ;; -- gt --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rbx\n");
                    out.write("    pop rax\n");
                    out.write("    cmp rax, rbx\n");
                    out.write("    cmovge rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.LE:
                    out.write("    ;; -- gt --\n")
                    out.write("    mov rcx, 0\n");
                    out.write("    mov rdx, 1\n");
                    out.write("    pop rbx\n");
                    out.write("    pop rax\n");
                    out.write("    cmp rax, rbx\n");
                    out.write("    cmovle rcx, rdx\n");
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.NE:
                    out.write("    ;; -- ne --\n")
                    out.write("    mov rcx, 0\n")
                    out.write("    mov rdx, 1\n")
                    out.write("    pop rbx\n")
                    out.write("    pop rax\n")
                    out.write("    cmp rax, rbx\n")
                    out.write("    cmovne rcx, rdx\n")
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.DUP:
                    out.write("    ;; -- dup --\n")
                    out.write("    pop rax\n")
                    out.write("    push rax\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SWAP:
                    out.write("    ;; -- swap --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    push rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.SWAP2:
                    out.write("    ;; -- swap --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    pop rcx\n")
                    out.write("    pop rdx\n")
                    out.write("    push rbx\n")
                    out.write("    push rax\n")
                    out.write("    push rdx\n")
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.DROP:
                    out.write("    ;; -- drop --\n")
                    out.write("    pop rax\n")
                elif op.operand == Intrinsic.OVER:
                    out.write("    ;; -- over --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    push rbx\n")
                    out.write("    push rax\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.ROT:
                    out.write("    ;; -- rot --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rbx\n")
                    out.write("    pop rcx\n")
                    out.write("    push rbx\n")
                    out.write("    push rax\n")
                    out.write("    push rcx\n")
                elif op.operand == Intrinsic.LOAD:
                    out.write("    ;; -- load --\n")
                    out.write("    pop rax\n")
                    out.write("    xor rbx, rbx\n")
                    out.write("    mov bl, [rax]\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.LOAD16:
                    out.write("    ;; -- load --\n")
                    out.write("    pop rax\n")
                    out.write("    xor rbx, rbx\n")
                    out.write("    mov bx, [rax]\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.LOAD32:
                    out.write("    ;; -- load --\n")
                    out.write("    pop rax\n")
                    out.write("    xor rbx, rbx\n")
                    out.write("    mov ebx, [rax]\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.LOAD64:
                    out.write("    ;; -- load64 --\n")
                    out.write("    pop rax\n")
                    out.write("    xor rbx, rbx\n")
                    out.write("    mov rbx, [rax]\n")
                    out.write("    push rbx\n")
                elif op.operand == Intrinsic.STORE:
                    out.write("    ;; -- store --\n")
                    out.write("    pop rax\n");
                    out.write("    pop rbx\n");
                    out.write("    mov [rax], bl\n");
                elif op.operand == Intrinsic.STORE16:
                    out.write("    ;; -- store --\n")
                    out.write("    pop rax\n");
                    out.write("    pop rbx\n");
                    out.write("    mov [rax], bx\n");
                elif op.operand == Intrinsic.STORE32:
                    out.write("    ;; -- store --\n")
                    out.write("    pop rax\n");
                    out.write("    pop rbx\n");
                    out.write("    mov [rax], ebx\n");
                elif op.operand == Intrinsic.STORE64:
                    out.write("    ;; -- store64 --\n")
                    out.write("    pop rax\n");
                    out.write("    pop rbx\n");
                    out.write("    mov [rax], rbx\n");
                elif op.operand == Intrinsic.ARGC:
                    out.write("    ;; -- argc --\n")
                    out.write("    mov rax, [args_ptr]\n")
                    out.write("    mov rax, [rax]\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.ARGV:
                    out.write("    ;; -- argv --\n")
                    out.write("    mov rax, [args_ptr]\n")
                    out.write("    add rax, 8\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.HERE:
                    value = ("%s:%d:%d" % op.token.loc).encode('utf-8')
                    n = len(value)
                    out.write("    ;; -- here --\n")
                    out.write("    mov rax, %d\n" % n)
                    out.write("    push rax\n")
                    out.write("    push str_%d\n" % len(strs))
                    strs.append(value)
                elif op.operand == Intrinsic.CAST_PTR:
                    out.write("    ;; -- cast(ptr) --\n")
                elif op.operand == Intrinsic.CAST_INT:
                    out.write("    ;; -- cast(int) --\n")
                elif op.operand == Intrinsic.CAST_BOOL:
                    out.write("    ;; -- cast(bool) --\n")
                elif op.operand == Intrinsic.SYSCALL0:
                    out.write("    ;; -- syscall0 --\n")
                    out.write("    pop rax\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL1:
                    out.write("    ;; -- syscall1 --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rdi\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL2:
                    out.write("    ;; -- syscall2 --\n")
                    out.write("    pop rax\n");
                    out.write("    pop rdi\n");
                    out.write("    pop rsi\n");
                    out.write("    syscall\n");
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL3:
                    out.write("    ;; -- syscall3 --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rdi\n")
                    out.write("    pop rsi\n")
                    out.write("    pop rdx\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL4:
                    out.write("    ;; -- syscall4 --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rdi\n")
                    out.write("    pop rsi\n")
                    out.write("    pop rdx\n")
                    out.write("    pop r10\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL5:
                    out.write("    ;; -- syscall5 --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rdi\n")
                    out.write("    pop rsi\n")
                    out.write("    pop rdx\n")
                    out.write("    pop r10\n")
                    out.write("    pop r8\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                elif op.operand == Intrinsic.SYSCALL6:
                    out.write("    ;; -- syscall6 --\n")
                    out.write("    pop rax\n")
                    out.write("    pop rdi\n")
                    out.write("    pop rsi\n")
                    out.write("    pop rdx\n")
                    out.write("    pop r10\n")
                    out.write("    pop r8\n")
                    out.write("    pop r9\n")
                    out.write("    syscall\n")
                    out.write("    push rax\n")
                else:
                    assert False, "unreachable"
            else:
                assert False, "unreachable"
        out.write("    mov rax, 60\n")
        out.write("    mov rdi, 0\n")
        out.write("    syscall\n")
        out.write("segment .data\n")
        for index, s in enumerate(strs):
            out.write("str_%d: db %s\n" % (index, ','.join(map(hex, list(s)))))
        out.write("segment .bss\n")
        if Library:
            out.write("extern args_ptr\n")
            out.write("extern ret_stack_rsp\n")
            out.write("extern ret_stack\n")
            out.write("extern ret_stack_end\n")
        else:
            out.write("global args_ptr\n")
            out.write("args_ptr: resq 1\n")
            out.write("global ret_stack_rsp\n")
            out.write("ret_stack_rsp: resq 1\n")
            out.write("global ret_stack\n")
            out.write("ret_stack: resq %d\n" % X86_64_RET_STACK_CAPACITY)
            out.write("global ret_stack_end\n")
            out.write("ret_stack_end:\n")
        if program.memCapacity > 0:
            out.write("mem: resb %d\n" % program.memCapacity)

assert len(Keyword) == 20, "Exhaustive KEYWORD_NAMES definition."
KEYWORD_NAMES = {
    'if': Keyword.IF,
    'elif': Keyword.ELIF,
    'else': Keyword.ELSE,
    'end': Keyword.END,
    'during': Keyword.WHILE,
    'go': Keyword.DO,
    'define': Keyword.MACRO,
    'addin': Keyword.INCLUDE,
    'alloc': Keyword.MEMORY,
    'fn': Keyword.FUNCTION,
    'const': Keyword.CONST,
    'offset': Keyword.OFFSET,
    'reset': Keyword.RESET,
    'assert': Keyword.ASSERT,
    'true': Keyword.TRUE,
    'false': Keyword.FALSE,
    'null': Keyword.NULL,
    'as': Keyword.AS,
    '->': Keyword.RETURN,
    'extern': Keyword.EXTERN,
}

assert len(DataType) == 3, "Exhaustive DATATYPES definition"
DATATYPES = {
    'int': DataType.INT,
    'ptr': DataType.PTR,
    'bool': DataType.BOOL,
}

assert len(Intrinsic) == 48, "Exhaustive INTRINSIC_BY_NAMES definition"
INTRINSIC_BY_NAMES = {
    '+': Intrinsic.PLUS,
    '-': Intrinsic.MINUS,
    '*': Intrinsic.MUL,
    '/': Intrinsic.DIV,
    '%': Intrinsic.MOD,
    'dump': Intrinsic.PRINT,
    '=': Intrinsic.EQ,
    '>': Intrinsic.GT,
    '<': Intrinsic.LT,
    '>=': Intrinsic.GE,
    '<=': Intrinsic.LE,
    '=>': Intrinsic.GE,
    '=<': Intrinsic.LE,
    '!=': Intrinsic.NE,
    '!': Intrinsic.INV,
    '>>': Intrinsic.SHR,
    '<<': Intrinsic.SHL,
    '|': Intrinsic.OR,
    '&': Intrinsic.AND,
    '~': Intrinsic.NOT,
    '^': Intrinsic.XOR,
    'dup': Intrinsic.DUP,
    '<>': Intrinsic.SWAP,
    '<<>>': Intrinsic.SWAP2,
    '_': Intrinsic.DROP,
    '<+>': Intrinsic.OVER,
    '<->': Intrinsic.ROT,
    ',8': Intrinsic.LOAD,
    ',16': Intrinsic.LOAD16,
    ',32': Intrinsic.LOAD32,
    ',64': Intrinsic.LOAD64,
    '.8': Intrinsic.STORE,
    '.16': Intrinsic.STORE16,
    '.32': Intrinsic.STORE32,
    '.64': Intrinsic.STORE64,
    '@ptr': Intrinsic.CAST_PTR,
    '@int': Intrinsic.CAST_INT,
    '@bool': Intrinsic.CAST_BOOL,
    '#c': Intrinsic.ARGC,
    '#v': Intrinsic.ARGV,
    '!?!': Intrinsic.HERE,
    'call0': Intrinsic.SYSCALL0,
    'call1': Intrinsic.SYSCALL1,
    'call2': Intrinsic.SYSCALL2,
    'call3': Intrinsic.SYSCALL3,
    'call4': Intrinsic.SYSCALL4,
    'call5': Intrinsic.SYSCALL5,
    'call6': Intrinsic.SYSCALL6,
    '[+]': Intrinsic.MAX,
    '[-]': Intrinsic.MIN,
}
INTRINSIC_NAMES = {v: k for k, v in INTRINSIC_BY_NAMES.items()}

@dataclass
class Macro:
    loc: Loc
    tokens: List[Token]

@dataclass
class Memory:
    loc: Loc
    addr: MemAddr

@dataclass
class Function:
    loc: Loc
    addr: OpAddr
    memories: Dict[str, Memory]
    memCapacity: int
    signature: Contract
    name: str

@dataclass
class Const:
    loc: Loc
    value: int
    typ: DataType

def check_valid_symbol(token: Token, name: str, macros: Dict[str, Macro], functions: Dict[str, Function], memories: Dict[str, Memory], consts: Dict[str, Const]):
    if name in macros:
        compiler_error_with_expansion_stack(token, "redefinition of already existing macro `%s`" % name)
        compiler_note(macros[name].loc, "the first definition is located here")
        exit(1)
    if name in memories:
        compiler_error_with_expansion_stack(token, "redefinition of already existing alloc `%s`" % name)
        compiler_note(memories[name].loc, "the first definition is located here")
        exit(1)
    if name in functions:
        compiler_error_with_expansion_stack(token, "redefinition of already existing function `%s`" % name)
        compiler_note(functions[name].loc, "the first definition is located here")
        exit(1)
    if name in consts:
        compiler_error_with_expansion_stack(token, "redefinition of already existing constant `%s`" % name)
        compiler_note(consts[name].loc, "the first definition is located here")
        exit(1)
    if name in INTRINSIC_BY_NAMES:
        compiler_error_with_expansion_stack(token, "redefinition of an intrinsic word `%s`. Please choose a different name for your macro." % (name, ))
        exit(1)

def eval_expression(rtokens: List[Token], macros: Dict[str, Macro], consts: Dict[str, Const], funcs: Dict[str, Function], iota: List[int]) -> Tuple[int, DataType]:
    stack: List[Tuple[int, DataType]] = []
    while len(rtokens) > 0:
        token = rtokens.pop()
        if token.typ == TokenType.KEYWORD:
            if token.value == Keyword.END:
                break
            elif token.value == Keyword.OFFSET:
                if len(stack) < 1:
                    compiler_error_with_expansion_stack(token, f"not enough arguments for `{KEYWORD_NAMES[str(token.value)]}` keyword")
                    exit(1)
                offset, t = stack.pop()
                if t != DataType.INT:
                    compiler_error_with_expansion_stack(token, f"Invalid argument types for `{token.value}` intrinsic: {t}")
                    compiler_note(token.loc, f"Expected:")
                    compiler_note(token.loc, f"  {DataType.INT}")
                stack.append((iota[0], DataType.INT))
                iota[0] += offset
            elif token.value == Keyword.RESET:
                stack.append((iota[0], DataType.INT))
                iota[0] = 0
            elif token.value == Keyword.TRUE:
                stack.append((1, DataType.BOOL))
            elif token.value == Keyword.FALSE:
                stack.append((0, DataType.BOOL))
            elif token.value == Keyword.NULL:
                stack.append((0, DataType.PTR))
            else:
                assert False, f"TODO: unsupported keyword {token.value} in compile time evaluations"
        elif token.typ == TokenType.INT:
            assert isinstance(token.value, int)
            stack.append((token.value, DataType.INT))
        elif token.typ == TokenType.WORD:
            assert isinstance(token.value, str), "lexer bug"
            if token.value in INTRINSIC_BY_NAMES:
                if token.value == INTRINSIC_NAMES[Intrinsic.PLUS]:
                    a, a_t = stack.pop()
                    b, b_t = stack.pop()
                    if a_t == DataType.INT and b_t == DataType.INT:
                        stack.append((a + b, DataType.INT))
                    elif a_t == DataType.INT and b_t == DataType.PTR:
                        stack.append((a + b, DataType.PTR))
                    elif a_t == DataType.PTR and b_t == DataType.INT:
                        stack.append((a + b, DataType.PTR))
                    else:
                        compiler_error_with_expansion_stack(token, f"Invalid argument types for `{token.value}` intrinsic: {(a_t, b_t)}")
                        compiler_note(token.loc, f"Expected:")
                        compiler_note(token.loc, f"  {(DataType.INT, DataType.INT)}")
                        compiler_note(token.loc, f"  {(DataType.INT, DataType.PTR)}")
                        compiler_note(token.loc, f"  {(DataType.PTR, DataType.INT)}")
                        exit(1)
                elif token.value == INTRINSIC_NAMES[Intrinsic.MUL]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type == b_type and a_type == DataType.INT:
                        stack.append((a * b, DataType.INT))
                    else:
                        compiler_error_with_expansion_stack(token, f"Invalid argument types for `{token.value}` intrinsic: {(a_type, b_type)}")
                        compiler_note(token.loc, f"Expected:")
                        compiler_note(token.loc, f"  {(DataType.INT, DataType.INT)}")
                        exit(1)
                elif token.value == INTRINSIC_NAMES[Intrinsic.DIV]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type == b_type and a_type == DataType.INT:
                        stack.append((b//a, DataType.INT))
                    else:
                        compiler_error_with_expansion_stack(token, f"Invalid argument types for `{token.value}` intrinsic: {(a_type, b_type)}")
                        compiler_note(token.loc, f"Expected:")
                        compiler_note(token.loc, f"  {(DataType.INT, DataType.INT)}")
                        exit(1)
                elif token.value == INTRINSIC_NAMES[Intrinsic.MOD]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type == b_type and a_type == DataType.INT:
                        stack.append((b%a, DataType.INT))
                    else:
                        compiler_error_with_expansion_stack(token, f"Invalid argument types for `{token.value}` intrinsic: {(a_type, b_type)}")
                        compiler_note(token.loc, f"Expected:")
                        compiler_note(token.loc, f"  {(DataType.INT, DataType.INT)}")
                        exit(1)
                elif token.value == INTRINSIC_NAMES[Intrinsic.DROP]:
                    if len(stack) < 1:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    stack.pop()
                elif token.value == INTRINSIC_NAMES[Intrinsic.CAST_BOOL]:
                    if len(stack) < 1:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    value, typ = stack.pop()
                    stack.append((value, DataType.BOOL))
                elif token.value == INTRINSIC_NAMES[Intrinsic.CAST_INT]:
                    if len(stack) < 1:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    value, typ = stack.pop()
                    stack.append((value, DataType.INT))
                elif token.value == INTRINSIC_NAMES[Intrinsic.CAST_PTR]:
                    if len(stack) < 1:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    value, typ = stack.pop()
                    stack.append((value, DataType.PTR))
                elif token.value == INTRINSIC_NAMES[Intrinsic.EQ]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(a == b), DataType.BOOL))
                elif token.value == INTRINSIC_NAMES[Intrinsic.NE]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(a != b), DataType.BOOL))
                elif token.value == INTRINSIC_NAMES[Intrinsic.GT]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(b > a), DataType.BOOL))
                elif token.value == INTRINSIC_NAMES[Intrinsic.LT]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(b < a), DataType.BOOL))
                elif INTRINSIC_BY_NAMES[token.value] == Intrinsic.GE:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(b >= a), DataType.BOOL))
                elif INTRINSIC_BY_NAMES[token.value] == Intrinsic.LE:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the same type. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((int(b <= a), DataType.BOOL))
                elif token.value == INTRINSIC_NAMES[Intrinsic.MIN]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type and a_type != DataType.INT:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the type INT. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((min(a, b), DataType.INT))
                elif token.value == INTRINSIC_NAMES[Intrinsic.MAX]:
                    if len(stack) < 2:
                        compiler_error_with_expansion_stack(token, f"not enough arguments for `{token.value}` intrinsic")
                        exit(1)
                    a, a_type = stack.pop()
                    b, b_type = stack.pop()
                    if a_type != b_type and a_type != DataType.INT:
                        compiler_error_with_expansion_stack(token, f"intrinsic `{token.value}` expects the arguments to have the type INT. The actual types are")
                        compiler_note(token.loc, f"    {(a_type, b_type)}")
                        exit(1)
                    stack.append((max(a, b), DataType.INT))
                else:
                    compiler_error_with_expansion_stack(token, f"TODO: Unsupported Intrinsic : {token.value}")
                    exit(1)
            elif token.value in macros:
                if token.expanded_count >= expansion_limit:
                    compiler_error_with_expansion_stack(token, "the macro exceeded the expansion limit (it expanded %d times)" % token.expanded_count)
                    exit(1)
                rtokens += reversed(expand_macro(macros[token.value], token))
            elif token.value in consts:
                const = consts[token.value]
                stack.append((const.value, const.typ))
            elif token.value in funcs:
                compiler_error_with_expansion_stack(token, f"function `{token.value}` can not be interpreted in compile time evaluation")
                exit(1)
            else:
                compiler_error_with_expansion_stack(token, f"Unknwon compile time word `{token.value}`")
                exit(1)
        else:
            assert False, "TODO: unsupported token"
    if len(stack) != 1:
        assert False, "TODO: error in const evaluation stack"
    return stack.pop()

def human(obj: Union[TokenType, Op, Intrinsic]) -> str:
    '''Human readable representation of an object that can be used in error messages'''
    assert len(TokenType) == 6, "Exhaustive handling of token types in human()"
    if obj == TokenType.WORD:
        return "a word"
    elif obj == TokenType.INT:
        return "an integer"
    elif obj == TokenType.STR:
        return "a string"
    elif obj == TokenType.CSTR:
        return "a C-style string"
    elif obj == TokenType.CHAR:
        return "a character"
    elif obj == TokenType.KEYWORD:
        return "a keyword"
    else:
        assert False, "unreachable"

def expand_macro(macro: Macro, expanded_from: Token) -> List[Token]:
    result = list(map(lambda x: copy(x), macro.tokens))
    for token in result:
        token.expanded_from = expanded_from
        token.expanded_count = expanded_from.expanded_count + 1
    return result

def parse_function_signature(rtokens: List[Token], last: Keyword) -> Contract:
    signature: Contract = Contract([], [])
    isIn = True
    while len(rtokens) > 0:
        tok = rtokens.pop()
        if tok.typ == TokenType.WORD:
            assert isinstance(tok.value, str), "lexer bug"
            if tok.value in DATATYPES:
                if isIn:
                    signature.ins.append(DATATYPES[tok.value])
                else:
                    signature.outs.append(DATATYPES[tok.value])
            else:
                compiler_error_with_expansion_stack(tok, f"Unexpected word {tok.value} in function signature")
                exit(1)
        elif tok.typ == TokenType.KEYWORD:
            if tok.value == Keyword.RETURN:
                if not isIn:
                    compiler_error_with_expansion_stack(tok, "keyword `->` cannot be used multiple times in function definition")
                isIn = False
            elif tok.value == last:
                return signature;
            else:
                compiler_error_with_expansion_stack(tok, f"Unexpected Keyword {tok.text} in function signature")
                exit(1)
        else:
            compiler_error_with_expansion_stack(tok, "only types, '->' operator, and as keyword are authorised in function signature")
            exit(1)
    compiler_error("file ended before function signature ended")
    exit(1)

def remap_symboles_to_addresses(symboles: Dict[str, Function]) -> Dict[OpAddr, Contract]:
    return {func.name: (func.signature, func.addr) for func in symboles.values()}

def parse_program_from_tokens(tokens: List[Token], include_paths: List[str], expansion_limit: int) -> Program:
    stack: List[OpAddr] = []
    program: Program = Program(ops=[], memCapacity=0)
    rtokens: List[Token] = list(reversed(tokens))
    macros: Dict[str, Macro] = {}
    functions: Dict[str, Function] = {}
    externs: Dict[str, Function] = {}
    memories: Dict[str, Memory] = {}
    consts: Dict[str, Const] = {}
    cur_proc: Optional[Function] = None
    ip: OpAddr = 0;
    iota: List[int] = [0]
    includes: List[str] = []
    while len(rtokens) > 0:
        token = rtokens.pop()
        assert len(TokenType) == 6, "Exhaustive token handling in parse_program_from_tokens"
        if token.typ == TokenType.WORD:
            assert isinstance(token.value, str), "This could be a bug in the lexer"
            if token.value in INTRINSIC_BY_NAMES:
                program.ops.append(Op(typ=OpType.INTRINSIC, token=token, operand=INTRINSIC_BY_NAMES[token.value]))
                ip += 1
            elif token.value in macros:
                if token.expanded_count >= expansion_limit:
                    compiler_error_with_expansion_stack(token, "the macro exceeded the expansion limit (it expanded %d times)" % token.expanded_count)
                    exit(1)
                rtokens += reversed(expand_macro(macros[token.value], token))
            elif cur_proc is not None and token.value in cur_proc.memories:
                program.ops.append(Op(typ=OpType.PUSH_LOCAL_MEM, token=token, operand=cur_proc.memories[token.value].addr))
                ip += 1
            elif token.value in memories:
                program.ops.append(Op(typ=OpType.PUSH_MEM, token=token, operand=memories[token.value].addr))
                ip += 1
            elif token.value in functions:
                program.ops.append(Op(typ=OpType.CALL, token=token, operand=token.value))
                ip += 1
            elif token.value in externs:
                program.ops.append(Op(typ=OpType.CALL, token=token, operand=token.value))
                ip += 1
            elif token.value in consts:
                c = consts[token.value]
                if c.typ == DataType.INT:
                    program.ops.append(Op(typ=OpType.PUSH_INT, token=token, operand=consts[token.value].value))
                if c.typ == DataType.BOOL:
                    program.ops.append(Op(typ=OpType.PUSH_BOOL, token=token, operand=consts[token.value].value))
                if c.typ == DataType.PTR:
                    program.ops.append(Op(typ=OpType.PUSH_PTR, token=token, operand=consts[token.value].value))
                ip += 1
            else:
                compiler_error_with_expansion_stack(token, "unknown word `%s`" % token.value)
                exit(1)
        elif token.typ == TokenType.INT:
            assert isinstance(token.value, int), "This could be a bug in the lexer"
            program.ops.append(Op(typ=OpType.PUSH_INT, operand=token.value, token=token))
            ip += 1
        elif token.typ == TokenType.STR:
            assert isinstance(token.value, str), "This could be a bug in the lexer"
            program.ops.append(Op(typ=OpType.PUSH_STR, operand=token.value, token=token));
            ip += 1
        elif token.typ == TokenType.CSTR:
            assert isinstance(token.value, str), "This could be a bug in the lexer"
            program.ops.append(Op(typ=OpType.PUSH_CSTR, operand=token.value, token=token));
            ip += 1
        elif token.typ == TokenType.CHAR:
            assert isinstance(token.value, int)
            program.ops.append(Op(typ=OpType.PUSH_INT, operand=token.value, token=token));
            ip += 1
        elif token.typ == TokenType.KEYWORD:
            assert len(Keyword) == 20, "Exhaustive keywords handling in parse_program_from_tokens()"
            if token.value == Keyword.TRUE:
                program.ops.append(Op(typ=OpType.PUSH_BOOL, operand=True, token=token))
                ip += 1
            elif token.value == Keyword.FALSE:
                program.ops.append(Op(typ=OpType.PUSH_BOOL, operand=False, token=token))
                ip += 1
            elif token.value == Keyword.NULL:
                program.ops.append(Op(typ=OpType.PUSH_PTR, operand=0, token=token))
                ip += 1
            elif token.value == Keyword.IF:
                program.ops.append(Op(typ=OpType.IF, token=token))
                stack.append(ip)
                ip += 1
            elif token.value == Keyword.ELIF:
                program.ops.append(Op(typ=OpType.ELIF, token=token))
                do_ip = stack.pop()
                if program.ops[do_ip].typ != OpType.DO:
                    compiler_error_with_expansion_stack(program.ops[do_ip].token, '`elif` can only close `do`-blocks')
                    exit(1)
                pre_do_ip = program.ops[do_ip].operand
                assert isinstance(pre_do_ip, OpAddr)
                if program.ops[pre_do_ip].typ == OpType.IF:
                    program.ops[do_ip].operand = ip + 1
                    stack.append(ip)
                    ip += 1
                elif program.ops[pre_do_ip].typ == OpType.ELIF:
                    program.ops[pre_do_ip].operand = ip
                    program.ops[do_ip].operand = ip + 1
                    stack.append(ip)
                    ip += 1
                else:
                    compiler_error_with_expansion_stack(program.ops[pre_do_ip].token, '`elif` can only close `do`-blocks that are preceded by `if` or another `elif`')
                    exit(1)
            elif token.value == Keyword.ELSE:
                program.ops.append(Op(typ=OpType.ELSE, token=token))
                do_ip = stack.pop()
                if program.ops[do_ip].typ != OpType.DO:
                    compiler_error_with_expansion_stack(program.ops[do_ip].token, '`else` can only be used in `do` blocks')
                    exit(1)
                pre_do_ip = program.ops[do_ip].operand
                assert isinstance(pre_do_ip, OpAddr)
                if program.ops[pre_do_ip].typ == OpType.IF:
                    program.ops[do_ip].operand = ip + 1
                    stack.append(ip)
                    ip += 1
                elif program.ops[pre_do_ip].typ == OpType.ELIF:
                    program.ops[pre_do_ip].operand = ip + 1
                    program.ops[do_ip].operand = ip + 1
                    stack.append(ip)
                    ip += 1
                else:
                    compiler_error_with_expansion_stack(program.ops[pre_do_ip].token, '`else` can only close `do`-blocks that are preceded by `if` or `elif`')
                    exit(1)
            elif token.value == Keyword.END:
                block_ip = stack.pop()
                if program.ops[block_ip].typ == OpType.ELSE:
                    program.ops.append(Op(typ=OpType.END, token=token))
                    program.ops[block_ip].operand = ip + 1
                    program.ops[ip].operand = ip + 1
                elif program.ops[block_ip].typ == OpType.DO:
                    program.ops.append(Op(typ=OpType.END, token=token))
                    assert program.ops[block_ip].operand is not None
                    pre_do_ip = program.ops[block_ip].operand

                    assert isinstance(pre_do_ip, OpAddr)
                    if program.ops[pre_do_ip].typ == OpType.WHILE:
                        program.ops[ip].operand = pre_do_ip
                        program.ops[block_ip].operand = ip + 1
                    elif program.ops[pre_do_ip].typ == OpType.IF:
                        program.ops[ip].operand = ip + 1
                        program.ops[block_ip].operand = ip + 1
                    elif program.ops[pre_do_ip].typ == OpType.ELIF:
                        program.ops[pre_do_ip].operand = ip + 1
                        program.ops[ip].operand = ip + 1
                        program.ops[block_ip].operand = ip + 1
                    else:
                        compiler_error_with_expansion_stack(program.ops[pre_do_ip].token, '`end` can only close `do` blocks that are preceded by `if`, `while` or `elif`')
                        exit(1)
                elif program.ops[block_ip].typ == OpType.STACK_FRAME:
                    assert cur_proc is not None
                    program.ops[block_ip].operand = cur_proc.memCapacity
                    program.ops.append(Op(typ=OpType.RETURN, token=token, operand=cur_proc.memCapacity))
                    cur_proc = None
                else:
                    compiler_error_with_expansion_stack(program.ops[block_ip].token, '`end` can only close `else`, `do`, `macro` or `fn` blocks for now')      
                    exit(1)
                ip += 1
            elif token.value == Keyword.WHILE:
                program.ops.append(Op(typ=OpType.WHILE, token=token))
                stack.append(ip)
                ip += 1
            elif token.value == Keyword.DO:
                program.ops.append(Op(typ=OpType.DO, token=token))
                if len(stack) == 0:
                    compiler_error_with_expansion_stack(token, "`do` is not preceded by `if`, `while` or `elif`")
                    exit(1)
                pre_do_ip = stack.pop()
                if program.ops[pre_do_ip].typ != OpType.WHILE and program.ops[pre_do_ip].typ != OpType.IF and program.ops[pre_do_ip].typ != OpType.ELIF:
                    compiler_error_with_expansion_stack(token, "`do` is not preceded by `if`, `while` or `elif`")
                    exit(1)
                program.ops[ip].operand = pre_do_ip
                stack.append(ip)
                ip += 1
            elif token.value == Keyword.INCLUDE:
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected path to the include file but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.STR:
                    compiler_error_with_expansion_stack(token, "expected path to the include file to be %s but found %s" % (human(TokenType.STR), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "This is probably a bug in the lexer"
                file_included = False
                for include_path in include_paths:
                    try:
                        if token.expanded_count >= expansion_limit:
                            compiler_error_with_expansion_stack(token, "the include exceeded the expansion limit (it expanded %d times)" % token.expanded_count)
                            exit(1)
                        tmp = reversed(lex_file(path.join(include_path, token.value + PORTH_EXT), token))
                        if not path.join(include_path, token.value + PORTH_EXT) in includes:
                            rtokens += tmp
                            includes.append(path.join(include_path, token.value + PORTH_EXT))
                        file_included = True
                        break
                    except FileNotFoundError:
                        continue
                if not file_included:
                    compiler_error_with_expansion_stack(token, "file `%s` not found" % (token.value + PORTH_EXT))
                    exit(1)
            elif token.value == Keyword.MEMORY:
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected alloc name but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.WORD:
                    compiler_error_with_expansion_stack(token, "expected alloc name to be %s but found %s" % (human(TokenType.WORD), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "This is probably a bug in the lexer"
                memname = token.value
                memloc = token.loc
                memsize, mem_size_type = eval_expression(rtokens, macros, consts, functions, iota)
                if mem_size_type != DataType.INT:
                    compiler_error_with_expansion_stack(token, f"Memory size must be of type {DataType.INT} but it is of type {mem_size_type}")
                    exit(1)
                if cur_proc is None:
                    check_valid_symbol(token, token.value, macros, functions, memories, consts)
                    memories[memname] = Memory(memloc, program.memCapacity)
                    program.memCapacity += memsize
                else:
                    check_valid_symbol(token, token.value, macros, functions, cur_proc.memories, consts)
                    cur_proc.memories[memname] = Memory(memloc, cur_proc.memCapacity)
                    cur_proc.memCapacity += memsize
            elif token.value == Keyword.CONST:
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected constant name but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.WORD:
                    compiler_error_with_expansion_stack(token, "expected constant name to be %s but found %s" % (human(TokenType.WORD), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "This is probably a bug in the lexer"
                check_valid_symbol(token, token.value, macros, functions, memories, consts)
                constname = token.value
                constloc = token.loc
                constsize, const_type = eval_expression(rtokens, macros, consts, functions, iota)
                consts[constname] = Const(constloc, constsize, const_type)
            elif token.value == Keyword.MACRO:
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected macro name but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.WORD:
                    compiler_error_with_expansion_stack(token, "expected macro name to be %s but found %s" % (human(TokenType.WORD), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "This is probably a bug in the lexer"
                check_valid_symbol(token, token.value, macros, functions, memories, consts)
                macro = Macro(token.loc, [])
                macros[token.value] = macro
                nesting_depth = 0
                while len(rtokens) > 0:
                    token = rtokens.pop()
                    if token.typ == TokenType.KEYWORD and token.value == Keyword.END and nesting_depth == 0:
                        break
                    else:
                        macro.tokens.append(token)
                        if token.typ == TokenType.KEYWORD:
                            assert len(Keyword) == 17, "Exhaustive handling of keyword in parsing macro body nest"
                            if token.value in [Keyword.IF, Keyword.WHILE, Keyword.MACRO, Keyword.MEMORY, Keyword.FUNCTION]:
                                nesting_depth += 1
                            elif token.value == Keyword.END:
                                nesting_depth -= 1
                if token.typ != TokenType.KEYWORD or token.value != Keyword.END:
                    compiler_error_with_expansion_stack(token, "expected `end` at the end of the macro definition but got `%s`" % (token.value, ))
                    exit(1)
            elif token.value == Keyword.FUNCTION:
                if cur_proc is not None:
                    compiler_error_with_expansion_stack(token, "nested procedure not allowed")
                    compiler_note(cur_proc.loc, "current procedure stating here")
                    exit(1)
                tok = token
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected procedure name but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.WORD:
                    compiler_error_with_expansion_stack(token, "expected function name to be %s but got %s" % (human(TokenType.WORD), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "lexing bug"
                for c in token.value:
                    if not (c.isalnum() or c == '_'):
                        compiler_error_with_expansion_stack(token, "error function names can only have alphanumerical characters or `_` character")
                        exit(1)
                program.ops.append(Op(typ=OpType.FUNCTION, token=tok, operand=token.value))
                proc_addr = ip
                ip += 1
                program.ops.append(Op(typ=OpType.STACK_FRAME, token=token))
                stack.append(ip)
                ip += 1
                check_valid_symbol(token, token.value, macros, functions, memories, consts)
                signature = parse_function_signature(rtokens, Keyword.AS)
                proc_loc = token.loc
                functions[token.value] = Function(token.loc, proc_addr + 1, {}, 0, signature, token.value)
                cur_proc = functions[token.value]
            elif token.value == Keyword.EXTERN:
                if cur_proc is not None:
                    compiler_error_with_expansion_stack(token, "nested procedure not allowed")
                    compiler_note(cur_proc.loc, "current procedure stating here")
                    exit(1)
                tok = token
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected procedure name but found nothing")
                    exit(1)
                token = rtokens.pop()
                if token.typ != TokenType.WORD:
                    compiler_error_with_expansion_stack(token, "expected function name to be %s but got %s" % (human(TokenType.WORD), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "lexing bug"
                for c in token.value:
                    if not (c.isalnum() or c == '_'):
                        compiler_error_with_expansion_stack(token, "error function names can only have alphanumerical characters or `_` character")
                        exit(1)
                check_valid_symbol(token, token.value, macros, functions, memories, consts)
                signature = parse_function_signature(rtokens, Keyword.END)
                proc_loc = token.loc
                externs[token.value] = Function(token.loc, 0, {}, 0, signature, token.value)
            elif token.value == Keyword.ASSERT:
                if len(rtokens) == 0:
                    compiler_error_with_expansion_stack(token, "expected procedure name but found nothing")
                    exit(1)
                assert_loc = token.loc
                token = rtokens.pop()
                if token.typ != TokenType.STR:
                    compiler_error_with_expansion_stack(token, "expected assert message to be %s but found %s" % (human(TokenType.STR), human(token.typ)))
                    exit(1)
                assert isinstance(token.value, str), "This is probably a bug in the lexer"
                assert_message = token.value
                assert_value, assert_type = eval_expression(rtokens, macros, consts, functions, iota)
                if assert_type != DataType.BOOL:
                    compiler_error_with_expansion_stack(token, f"assertion body must return type {DataType.INT} but it is of type {assert_type}")
                    exit(1)
                if assert_value == 0:
                    compiler_error_with_expansion_stack(token, f"Static Assertion Failed: {assert_message}");
                    exit(1)
            elif token.value in [Keyword.OFFSET, Keyword.RESET]:
                compiler_error_with_expansion_stack(token, f"keyword `{token.text}` is supported only in compile time evaluation context")
                exit(1)
            elif token.value in [Keyword.AS, Keyword.RETURN]:
                compiler_error_with_expansion_stack(token, f"keyword `{token.text}` is supported only in function signatures")
                exit(1)
            else:
                print(token)
                assert False, 'unreachable';
        else:
            assert False, 'unreachable'

    if len(stack) > 0:
        compiler_error_with_expansion_stack(program.ops[stack.pop()].token, 'unclosed block')
        exit(1)

    if not Library and not "main" in functions:
        compiler_error_with_expansion_stack(program.ops[0].token, 'unable to find main function in file')
        exit(1)

    return program, remap_symboles_to_addresses(functions), {func.name: func.signature for func in externs.values()}

def find_col(line: str, start: int, predicate: Callable[[str], bool]) -> int:
    while start < len(line) and not predicate(line[start]):
        start += 1
    return start

def unescape_string(s: str) -> str:
    # NOTE: unicode_escape assumes latin-1 encoding, so we kinda have
    # to do this weird round trip
    return s.encode('utf-8').decode('unicode_escape').encode('latin-1').decode('utf-8')

def find_string_literal_end(line: str, start: int) -> int:
    prev = line[start]
    while start < len(line):
        curr = line[start]
        if curr == '"' and prev != '\\':
            break
        prev = curr
        start += 1
    return start

def lex_lines(file_path: str, lines: List[str]) -> Generator[Token, None, None]:
    assert len(TokenType) == 6, 'Exhaustive handling of token types in lex_lines'
    row = 0
    str_literal_buf = ""
    while row < len(lines):
        line = lines[row]
        col = find_col(line, 0, lambda x: not x.isspace())
        col_end = 0
        while col < len(line):
            loc = (file_path, row + 1, col + 1)
            if line[col] == '"':
                while row < len(lines):
                    start = col
                    if str_literal_buf == "":
                        start += 1
                    else:
                        line = lines[row]
                    col_end = find_string_literal_end(line, start)
                    if col_end >= len(line) or line[col_end] != '"':
                        str_literal_buf += line[start:]
                        row +=1
                        col = 0
                    else:
                        str_literal_buf += line[start:col_end]
                        break
                if row >= len(lines):
                    compiler_error(loc, "unclosed string literal")
                    exit(1)
                assert line[col_end] == '"'
                col_end += 1
                text_of_token = str_literal_buf
                str_literal_buf = ""
                if col_end < len(line) and line[col_end] == 'C':
                    col_end += 1
                    yield Token(TokenType.CSTR, text_of_token, loc, unescape_string(text_of_token))
                else:
                    yield Token(TokenType.STR, text_of_token, loc, unescape_string(text_of_token))
                col = find_col(line, col_end, lambda x: not x.isspace())
            elif line[col] == "'":
                col_end = find_col(line, col+1, lambda x: x == "'")
                if col_end >= len(line) or line[col_end] != "'":
                    compiler_error(loc, "unclosed character literal")
                    exit(1)
                text_of_token = line[col+1:col_end]
                char_bytes = unescape_string(text_of_token).encode('utf-8')
                if len(char_bytes) != 1:
                    compiler_error(loc, "only a single byte is allowed inside of a character literal")
                    exit(1)
                yield Token(TokenType.CHAR, text_of_token, loc, char_bytes[0])
                col = find_col(line, col_end+1, lambda x: not x.isspace())
            else:
                col_end = find_col(line, col, lambda x: x.isspace())
                text_of_token = line[col:col_end]

                try:
                    yield Token(TokenType.INT, text_of_token, loc, int(text_of_token))
                except ValueError:
                    if text_of_token in KEYWORD_NAMES:
                        yield Token(TokenType.KEYWORD, text_of_token, loc, KEYWORD_NAMES[text_of_token])
                    else:
                        if text_of_token.startswith("//"):
                            break
                        yield Token(TokenType.WORD, text_of_token, loc, text_of_token)
                col = find_col(line, col_end, lambda x: not x.isspace())
        row += 1

def lex_file(file_path: str, expanded_from: Optional[Token] = None) -> List[Token]:
    with open(file_path, "r", encoding='utf-8') as f:
        result = [token for token in lex_lines(file_path, f.readlines())]
        for token in result:
            if expanded_from is not None:
                token.expanded_from = expanded_from
                token.expanded_count = expanded_from.expanded_count + 1
        return result

def parse_program_from_file(file_path: str, include_paths: List[str], expansion_limit: int) -> Program:
    return parse_program_from_tokens(lex_file(file_path), include_paths, expansion_limit)

def cmd_call_echoed(cmd: List[str], silent: bool) -> int:
    if not silent:
        print("[CMD] %s" % " ".join(map(shlex.quote, cmd)))
    return subprocess.call(cmd)

def generate_control_flow_graph_as_dot_file(program: Program, dot_path: str):
    with open(dot_path, "w") as f:
        f.write("digraph Program {\n")
        assert len(OpType) == 14, "Exhaustive handling of OpType in generate_control_flow_graph_as_dot_file()"
        for ip in range(len(program.ops)):
            op = program.ops[ip]
            if op.typ == OpType.INTRINSIC:
                assert isinstance(op.operand, Intrinsic)
                f.write(f"    Node_{ip} [label={repr(repr(INTRINSIC_NAMES[op.operand]))}];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.PUSH_STR:
                assert isinstance(op.operand, str)
                f.write(f"    Node_{ip} [label={repr(repr(op.operand))}];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.PUSH_CSTR:
                assert isinstance(op.operand, str)
                f.write(f"    Node_{ip} [label={repr(repr(op.operand))}];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.PUSH_INT:
                assert isinstance(op.operand, int)
                f.write(f"    Node_{ip} [label={op.operand}]\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.IF:
                f.write(f"    Node_{ip} [shape=record label=if];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.WHILE:
                f.write(f"    Node_{ip} [shape=record label=while];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            elif op.typ == OpType.DO:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=do];\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1} [label=true];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand} [label=false style=dashed];\n")
            elif op.typ == OpType.ELSE:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=else];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand};\n")
            elif op.typ == OpType.ELIF:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=elif];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand};\n")
            elif op.typ == OpType.END:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=end];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand};\n")
            elif op.typ == OpType.FUNCTION:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=fn];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand};\n")
            elif op.typ == OpType.RETURN:
                f.write(f"    Node_{ip} [shape=record label=return];\n")
            elif op.typ == OpType.CALL:
                assert isinstance(op.operand, OpAddr)
                f.write(f"    Node_{ip} [shape=record label=call];\n")
                f.write(f"    Node_{ip} -> Node_{op.operand};\n")
                f.write(f"    Node_{ip} -> Node_{ip + 1};\n")
            else:
                assert False, f"unimplemented operation {op.typ}"
        f.write(f"    Node_{len(program.ops)} [label=halt];\n")
        f.write("}\n")

def usage(compiler_name: str):
    print("Usage: %s [OPTIONS] <SUBCOMMAND> [ARGS]" % compiler_name)
    print("  OPTIONS:")
    print("    -debug                Enable debug mode.")
    print("    -I <path>             Add the path to the include search list")
    print("    -E <expansion-limit>  Macro and include expansion limit. (Default %d)" % DEFAULT_EXPANSION_LIMIT)
    print("    -unsafe               Disable type checking.")
    print("  SUBCOMMAND:")
    print("    -c [OPTIONS] <file>  Compile the program")
    print("      OPTIONS:")
    print("        -r                  Run the program after successful compilation")
    print("        -o <file|dir>       Customize the output path")
    print("        -s                  Silent mode. Don't print any info about compilation phases.")
    print("        -cf                 Dump Control Flow graph of the program in a dot format.")
    print("    help                  Print this help to stdout and exit with 0 code")

if __name__ == '__main__' and '__file__' in globals():
    argv = sys.argv
    assert len(argv) >= 1
    compiler_name, *argv = argv

    include_paths = ['.', './lib', os.path.expanduser('~') + "/.local/lib/thrust"]
    expansion_limit = DEFAULT_EXPANSION_LIMIT
    unsafe = False

    while len(argv) > 0:
        if argv[0] == '-debug':
            argv = argv[1:]
            debug = True
        elif argv[0] == '-I':
            argv = argv[1:]
            if len(argv) == 0:
                usage(compiler_name)
                print("[ERROR] no path is provided for `-I` flag", file=sys.stderr)
                exit(1)
            include_path, *argv = argv
            include_paths.append(include_path)
        elif argv[0] == '-E':
            argv = argv[1:]
            if len(argv) == 0:
                usage(compiler_name)
                print("[ERROR] no value is provided for `-E` flag", file=sys.stderr)
                exit(1)
            arg, *argv = argv
            expansion_limit = int(arg)
        elif argv[0] == '-unsafe':
            argv = argv[1:]
            unsafe = True
        else:
            break

    if debug:
        print("[INFO] Debug mode is enabled")

    if len(argv) < 1:
        usage(compiler_name)
        print("[ERROR] no subcommand is provided", file=sys.stderr)
        exit(1)
    subcommand, *argv = argv

    program_path: Optional[str] = None

    if subcommand == "-c":
        silent = False
        control_flow = False
        run = False
        output_path = None
        linkArgs = []
        while len(argv) > 0:
            arg, *argv = argv
            if arg == '-r':
                run = True
            elif arg == '-s':
                silent = True
            elif arg == '-o':
                if len(argv) == 0:
                    usage(compiler_name)
                    print("[ERROR] no argument is provided for parameter -o", file=sys.stderr)
                    exit(1)
                output_path, *argv = argv
            elif arg == '-lib':
                Library = True
            elif arg == '-z':
                if len(argv) == 0:
                    usage(compiler_name)
                    print("[ERROR] no argument is provided for parameter -z", file=sys.stderr)
                    exit(1)
                tmpArg, *argv = argv
                linkArgs.append(tmpArg)
            elif arg == '-cf':
                control_flow = True
            else:
                program_path = arg
                break

        if program_path is None:
            usage(compiler_name)
            print("[ERROR] no input file is provided for the compilation", file=sys.stderr)
            exit(1)

        basename = None
        basedir = None
        if output_path is not None:
            if path.isdir(output_path):
                basename = path.basename(program_path)
                if basename.endswith(PORTH_EXT):
                    basename = basename[:-len(PORTH_EXT)]
                basedir = path.dirname(output_path)
            else:
                basename = path.basename(output_path)
                basedir = path.dirname(output_path)
        else:
            basename = path.basename(program_path)
            if basename.endswith(PORTH_EXT):
                basename = basename[:-len(PORTH_EXT)]
            basedir = path.dirname(program_path)

        # if basedir is empty we should "fix" the path appending the current working directory.
        # So we avoid `com -r` to run command from $PATH.
        if basedir == "":
            basedir = os.getcwd()
        basepath = path.join(basedir, basename)

        include_paths.append(path.dirname(program_path))

        program, contracts, externs = parse_program_from_file(program_path, include_paths, expansion_limit);
        if control_flow:
            dot_path = basepath + ".dot"
            if not silent:
                print(f"[INFO] Generating {dot_path}")
            generate_control_flow_graph_as_dot_file(program, dot_path)
            cmd_call_echoed(["dot", "-Tsvg", "-O", dot_path], silent)
        if not unsafe:
            type_check_program(program, contracts, externs)
        if not silent:
            print("[INFO] Generating %s" % (basepath + ".asm"))
        generate_nasm_linux_x86_64(program, basepath + ".asm", [names for names in externs.keys()])
        cmd_call_echoed(["nasm", "-felf64", basepath + ".asm"], silent)
        if not Library:
            cmd_call_echoed(["ld", "-o", basepath, basepath + ".o"] + linkArgs, silent)
        else:
            cmd_call_echoed(["ar", "rcs", basepath + '.a', basepath + ".o"] + linkArgs, silent)
        if run:
            exit(cmd_call_echoed([basepath] + argv, silent))
    elif subcommand == "help":
        usage(compiler_name)
        exit(0)
    else:
        usage(compiler_name)
        print("[ERROR] unknown subcommand %s" % (subcommand), file=sys.stderr)
        exit(1)

