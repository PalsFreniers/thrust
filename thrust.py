#!/usr/bin/env python3
import sys
import os
from os import path
import subprocess as sp
from copy import copy
from enum import Enum, auto

debug = False

unsafe = False

iotaCount = 0

expantion_limit = 1000

EXPANSION_DIAGNOSTIC_LIMIT = 1000

ipath = ['.', './lib', os.path.expanduser('~') + "/.local/lib/thrust"]


def iota(reset=False):
    global iotaCount
    if reset:
        iotaCount = 0
    result = iotaCount
    iotaCount += 1
    return result


MEM_CAPACITY = 1_000_000  # 1 MB
STR_CAPACITY = 1_000_000  # 1 MB
ARG_CAPACITY = 1_000_000  # 1 MB

OP_PUSH = iota(True)
OP_DUP = iota()
OP_SWAP = iota()
OP_ROTATE = iota()
OP_OVER = iota()
OP_PLUS = iota()
OP_MINUS = iota()
OP_MUL = iota()
OP_DIV = iota()
OP_MOD = iota()
OP_EQUAL = iota()
OP_GREATER = iota()
OP_LESS = iota()
OP_GEQ = iota()
OP_LEQ = iota()
OP_NEQ = iota()
OP_IF = iota()
OP_ELSE = iota()
# OP_ELIF = iota()
OP_DURING = iota()
OP_GO = iota()
OP_END = iota()
OP_DUMP = iota()
OP_TRASH = iota()
OP_MEM = iota()
OP_MEMREAD = iota()
OP_MEMREAD16 = iota()
OP_MEMREAD32 = iota()
OP_MEMREAD64 = iota()
OP_MEMWRITE = iota()
OP_MEMWRITE16 = iota()
OP_MEMWRITE32 = iota()
OP_MEMWRITE64 = iota()
OP_CALL0 = iota()
OP_CALL1 = iota()
OP_CALL2 = iota()
OP_CALL3 = iota()
OP_CALL4 = iota()
OP_CALL5 = iota()
OP_CALL6 = iota()
OP_SHR = iota()
OP_SHL = iota()
OP_AND = iota()
OP_OR = iota()
OP_NOT = iota()
OP_XOR = iota()
OP_ARGC = iota()
OP_ARGV = iota()
OP_STORESTR = iota()
OP_STORECSTR = iota()
OP_DEFINE = iota()
OP_ADDIN = iota()
OP_CAST_PTR = iota()
OP_CAST_BOOL = iota()
OP_CAST_INT = iota()
OP_HERE = iota()
COUNT_OP = iota()
operations = {
    OP_PUSH      : "push_int",
    OP_DUP       : "dup",
    OP_SWAP      : "swap",
    OP_ROTATE    : "rotate",
    OP_OVER      : "over",
    OP_PLUS      : "plus",
    OP_MINUS     : "minus",
    OP_MUL       : "mul",
    OP_DIV       : "div",
    OP_MOD       : "mod",
    OP_EQUAL     : "equal",
    OP_GREATER   : "greater",
    OP_LESS      : "less",
    OP_GEQ       : "geq",
    OP_LEQ       : "leq",
    OP_NEQ       : "neq",
    OP_IF        : "if",
    OP_ELSE      : "else",
    OP_DURING    : "during",
    OP_GO        : "go",
    OP_END       : "end",
    OP_DUMP      : "dump",
    OP_TRASH     : "trash",
    OP_MEM       : "mem",
    OP_MEMREAD   : "memread",
    OP_MEMREAD16 : "memread16",
    OP_MEMREAD32 : "memread32",
    OP_MEMREAD64 : "memread64",
    OP_MEMWRITE  : "memwrite",
    OP_MEMWRITE16: "memwrite16",
    OP_MEMWRITE32: "memwrite32",
    OP_MEMWRITE64: "memwrite64",
    OP_CALL0     : "call0",
    OP_CALL1     : "call1",
    OP_CALL2     : "call2",
    OP_CALL3     : "call3",
    OP_CALL4     : "call4",
    OP_CALL5     : "call5",
    OP_CALL6     : "call6",
    OP_SHR       : "shr",
    OP_SHL       : "shl",
    OP_AND       : "and",
    OP_OR        : "or",
    OP_NOT       : "not",
    OP_XOR       : "xor",
    OP_ARGC      : "argc",
    OP_ARGV      : "argv",
    OP_STORESTR  : "push_str",
    OP_STORECSTR : "push_cstr",
    OP_DEFINE    : "define",
    OP_ADDIN     : "addin",
    OP_CAST_PTR  : "cast_ptr",
    OP_CAST_BOOL : "cast_bool",
    OP_CAST_INT  : "cast_int",
    OP_HERE      : "here",
}

TOK_WORD = iota(True)
TOK_INT = iota()
TOK_STR = iota()
TOK_CSTR = iota()
TOK_CHAR = iota()
COUNT_TOK = iota()

class Types(Enum):
    Int  = auto()
    Ptr  = auto()
    Bool = auto()

def compiler_diagnostic_expand(place):
    if not "expanded_from" in place.keys():
        return 
    stack = place
    limit = 0
    if debug:
        print("[DEBUG] %s:%d:%d -> diagnostic called for token : " % place["loc"], place)
    while "expanded_from" in stack.keys() and limit <= EXPANSION_DIAGNOSTIC_LIMIT:
        stack = stack["expanded_from"]
        print("[NOTE] %s:%d:%d -> expanded from %s macro" % (stack["loc"] + (stack["value"], )))
        limit += 1
    if limit > EXPANSION_DIAGNOSTIC_LIMIT:
        print('...')
        print('... too many expansions ...')
        print('...')

def typecheck(program):
    stack = []
    save_stack = []
    for ip in range(len(program)):
        op = program[ip]
        assert COUNT_OP == 55, "Missing operation in type checking"
        assert len(Types) == 3, "Missing Types in type checking"
        if   op["type"] == OP_PUSH:
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_DUP:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tdup operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            a = stack.pop()
            stack.append(a)
            stack.append((a[0], op["loc"]))
        elif op["type"] == OP_SWAP:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tswap operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            a = stack.pop()
            b = stack.pop()
            stack.append(a)
            stack.append(b)
        elif op["type"] == OP_ROTATE:
            if(len(stack) < 3):
                print("[ERROR] %s:%d:%d -> not enough argument \n\trotate operation need 3 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            a = stack.pop()
            b = stack.pop()
            c = stack.pop()
            stack.append(b)
            stack.append(a)
            stack.append(c)
        elif op["type"] == OP_OVER:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tover operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            a = stack.pop()
            b = stack.pop()
            stack.append(b)
            stack.append(a)
            stack.append((b[0], op["loc"]))
        elif op["type"] == OP_PLUS:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tplus operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == Types.Int and at == bt:
                stack.append((Types.Int, op["loc"]))
                continue
            if at != Types.Int and at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tplus operation need Types.Int or Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int and bt != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tplus operation need Types.Int or Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if at != bt:
                stack.append((Types.Ptr, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tplus operation need Types.Int, Types.Ptr and not both the same if Types.Ptr is first but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_MINUS:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tminus operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int and at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tplus operation need Types.Int or Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int and bt != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tplus operation need Types.Int or Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if at == bt and at == Types.Ptr:
                stack.append((Types.Ptr, op["loc"]))
            elif at == bt and at == Types.Int:
                stack.append((Types.Int, op["loc"]))
            elif bt == Types.Ptr and at == Types.Int:
                stack.append((Types.Ptr, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tminus operation need Types.Int as first argument and Types.Ptr as second argument but got %s at %s:%d:%d as first argument and %s at %s:%d:%d as second argument" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_MUL:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tmul operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tmul operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tmul operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_DIV:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tdiv operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tdiv operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tdiv operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_MOD:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tmod operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tmod operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tmod operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_EQUAL:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tequal operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tequal operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_GREATER:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tgreater operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tgreater operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_LESS:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tless operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tless operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_GEQ:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tgreater-or-equal operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tgreater-or-equal operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_LEQ:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tless-or-equal operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tless-or-equal operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_NEQ:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tnot-equal operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at == bt and (at == Types.Int or at == Types.Ptr or at == Types.Bool):
                stack.append((Types.Bool, op["loc"]))
            else:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tnot-equal operation need Types.Int, Type.Ptr or Types.Bool for both the arguments but got %s at %s:%d:%d and %s at %s:%d:%d" % (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_IF:
            save_stack.append((copy(stack), op["type"]))
        elif op["type"] == OP_ELSE:
            snap, snapt = save_stack.pop()
            assert snapt == OP_GO, "Compile error unreachable"
            save_stack.append((copy(stack), op["type"]))
            stack = snap
        elif op["type"] == OP_DURING:
            save_stack.append((copy(stack), op["type"]))
        elif op["type"] == OP_GO:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tgo operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad arguments \n\tgo operation need Types.Bool argument but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            snap, snapt = save_stack.pop()
            assert snapt == OP_DURING or snapt == OP_IF, "Compile error unreachable"
            snat = list(map(lambda x: x[0], snap))
            actt  = list(map(lambda x: x[0], stack))
            if not snat == actt:
                print("[ERROR] %s:%d:%d -> modified stack founded after the condition of go block" % op["loc"])
                print("[NOTE] %s:%d:%d -> expected : %s" % (op["loc"] + (snat, )))
                print("[NOTE] %s:%d:%d -> actual   : %s" % (op["loc"] + (actt, )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            save_stack.append((copy(stack), op["type"]))
        elif op["type"] == OP_END:
            snap, snap_block = save_stack.pop()
            snapt = list(map(lambda x: x[0], snap))
            actt  = list(map(lambda x: x[0], stack))
            if snap_block == OP_ELSE:
                if not snapt == actt:
                    print("[ERROR] %s:%d:%d -> stack error founded at the end of if else block if-else need to modify the stack the same way in both blocks" % op["loc"])
                    print("[NOTE] %s:%d:%d -> expected : %s" % (op["loc"] + (snapt, )))
                    print("[NOTE] %s:%d:%d -> actual   : %s" % (op["loc"] + (actt, )))
                    compiler_diagnostic_expand(op["token"])
                    exit(1)
            elif snap_block == OP_GO:
                if not snapt == actt:
                    print("[ERROR] %s:%d:%d -> modified stack founded at the end of during-go block" % op["loc"])
                    print("[NOTE] %s:%d:%d -> expected : %s" % (op["loc"] + (snapt, )))
                    print("[NOTE] %s:%d:%d -> actual   : %s" % (op["loc"] + (actt, )))
                    compiler_diagnostic_expand(op["token"])
                    exit(1)
            else:
                assert False, "unreachable"
        elif op["type"] == OP_DUMP:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tdump operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.pop()
        elif op["type"] == OP_TRASH:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\ttrash operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.pop()
        elif op["type"] == OP_MEM:
            stack.append((Types.Ptr, op["loc"]))
        elif op["type"] == OP_MEMREAD:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tread operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_MEMREAD16:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tread operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_MEMREAD32:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tread operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_MEMREAD64:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tread operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Ptr:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_MEMWRITE:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\twrite operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if bt != Types.Ptr and at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr as first argument and Types.Int as second argumnt but got %s at %s:%d:%d as first argument and %s at %s:%d:%d aas second argument" % (op["loc"] + (bt, ) + bl + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_MEMWRITE16:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\twrite operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if bt != Types.Ptr and at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr as first argument and Types.Int as second argumnt but got %s at %s:%d:%d as first argument and %s at %s:%d:%d aas second argument" % (op["loc"] + (bt, ) + bl + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_MEMWRITE32:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\twrite operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if bt != Types.Ptr and at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr as first argument and Types.Int as second argumnt but got %s at %s:%d:%d as first argument and %s at %s:%d:%d aas second argument" % (op["loc"] + (bt, ) + bl + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_MEMWRITE64:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\twrite operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if bt != Types.Ptr and at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad argument \n\tread operation need Types.Ptr as first argument and Types.Int as second argumnt but got %s at %s:%d:%d as first argument and %s at %s:%d:%d aas second argument" % (op["loc"] + (bt, ) + bl + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
        elif op["type"] == OP_CALL0:
            if len(stack) < 1:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall0 operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL1:
            if len(stack) < 2:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall1 operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL2:
            if len(stack) < 0:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall2 operation need 3 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL3:
            if len(stack) < 4:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall3 operation need 4 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL4:
            if len(stack) < 5:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall4 operation need 5 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL5:
            if len(stack) < 6:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall5 operation need 6 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_CALL6:
            if len(stack) < 7:
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcall6 operation need 7 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            callt, calll = stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            stack.pop()
            if callt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad call argument \n\tcall operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (callt, ) + calll))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_ARGC:
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_ARGV:
            stack.append((Types.Ptr, op["loc"]))
        elif op["type"] == OP_SHR:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tshift right operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tshift right operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tshift right operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_SHL:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tshift left operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tshift left operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tshift left operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_AND:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tand operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int and at != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tand operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int and bt != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tand operation need Types.Int and Types.Bool but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if at != bt:
                print("[ERROR] %s:%d:%d -> and operation need to have both input as th same type but got %s at %s:%d:%d and %s at %s:%d:%d", (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_OR:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tor operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int and at != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tor operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int and bt != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad second argument \n\tor operation need Types.Int or Types.Bool but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if at != bt:
                print("[ERROR] %s:%d:%d -> or operation need to have both input as th same type but got %s at %s:%d:%d and %s at %s:%d:%d", (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_XOR:
            if(len(stack) < 2):
                print("[ERROR] %s:%d:%d -> not enough argument \n\txor operation need 2 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            bt, bl = stack.pop()
            if at != Types.Int and at != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad first argument \n\txor operation need Types.Int but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if bt != Types.Int and bt != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad second argument \n\txor operation need Types.Int or Types.Bool but got %s at %s:%d:%d" % (op["loc"] + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            if at != bt:
                print("[ERROR] %s:%d:%d -> xor operation need to have both input as th same type but got %s at %s:%d:%d and %s at %s:%d:%d", (op["loc"] + (at, ) + al + (bt, ) + bl))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_NOT:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tnot operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            at, al = stack.pop()
            if at != Types.Int and at != Types.Bool:
                print("[ERROR] %s:%d:%d -> bad first argument \n\tnot operation need Types.Int or Types.Bool but got %s at %s:%d:%d" % (op["loc"] + (at, ) + al))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            stack.append((Types.Int, op["loc"]))
        elif op["type"] == OP_STORESTR:
            stack.append((Types.Int, op["loc"]))
            stack.append((Types.Ptr, op["loc"]))
        elif op["type"] == OP_STORECSTR:
            stack.append((Types.Ptr, op["loc"]))
        elif op["type"] == OP_CAST_PTR:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcast operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            _, al = stack.pop()
            stack.append((Types.Ptr, al))
        elif op["type"] == OP_CAST_INT:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcast operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            _, al = stack.pop()
            stack.append((Types.Int, al))
        elif op["type"] == OP_CAST_BOOL:
            if(len(stack) < 1):
                print("[ERROR] %s:%d:%d -> not enough argument \n\tcast operation need 1 but found %d" % (op["loc"] + (len(stack), )))
                compiler_diagnostic_expand(op["token"])
                exit(1)
            _, al = stack.pop()
            stack.append((Types.Bool, al))
        elif op["type"] == OP_HERE:
            stack.append((Types.Int, op["token"]))
            stack.append((Types.Ptr, op["token"]))
        else:
            assert False, "Unknown operation |unreachable| %d" % op["type"]
    if len(stack) > 0:
        stck = list(map(lambda x: x[0], stack))
        print("[ERROR] %s:%d:%d -> unhandled operation result on the stack founded : %s" % (stack[-1][1] + (stck, )))
        exit(1)




def simulate(program, argv, dmpMem=False, count=0):
    stack = []
    rmem = bytearray(MEM_CAPACITY + STR_CAPACITY + ARG_CAPACITY + 1) # null ptr padding
    strSize = 0
    strptrs = {}
    strptr = 1
    argptr = 1 + STR_CAPACITY
    argc = 0
    memptr = 1 + STR_CAPACITY + ARG_CAPACITY
    ip = 0
    rmem[0] = 0
    for arg in argv:
        value = bytes(arg, "utf-8")
        n = len(value)
        argbufptr = strptr+strSize
        rmem[argbufptr:argbufptr+n] = value
        rmem[argbufptr+n] = 0
        strSize += n + 1
        assert strSize <= STR_CAPACITY, "String Mem overflow"
        argvptr = argptr+argc*8
        rmem[argvptr:argvptr+8] = argbufptr.to_bytes(8, byteorder='little')
        argc += 1
        assert argc * 8 <= ARG_CAPACITY, "Argv buffer overflow"
    while ip < len(program):
        op = program[ip]
        assert COUNT_OP == 55, "Missing operation in simulation switch"
        if op["type"] == OP_PUSH:
            stack.append(op["value"])
        elif op["type"] == OP_DUP:
            a = stack.pop()
            stack.append(a)
            stack.append(a)
        elif op["type"] == OP_SWAP:
            a = stack.pop()
            b = stack.pop()
            stack.append(a)
            stack.append(b)
        elif op["type"] == OP_ROTATE:
            a = stack.pop()
            b = stack.pop()
            c = stack.pop()
            stack.append(b)
            stack.append(a)
            stack.append(c)
        elif op["type"] == OP_OVER:
            a = stack.pop()
            b = stack.pop()
            stack.append(b)
            stack.append(a)
            stack.append(b)
        elif op["type"] == OP_PLUS:
            a = stack.pop()
            b = stack.pop()
            stack.append(a + b)
        elif op["type"] == OP_MINUS:
            a = stack.pop()
            b = stack.pop()
            stack.append(b - a)
        elif op["type"] == OP_MUL:
            a = stack.pop()
            b = stack.pop()
            stack.append(a * b)
        elif op["type"] == OP_DIV:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a / b))
        elif op["type"] == OP_MOD:
            b = stack.pop()
            a = stack.pop()
            stack.append(a % b)
        elif op["type"] == OP_EQUAL:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a == b))
        elif op["type"] == OP_GREATER:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a > b))
        elif op["type"] == OP_LESS:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a < b))
        elif op["type"] == OP_GEQ:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a >= b))
        elif op["type"] == OP_LEQ:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a <= b))
        elif op["type"] == OP_NEQ:
            b = stack.pop()
            a = stack.pop()
            stack.append(int(a != b))
        elif op["type"] == OP_IF:
            pass
        elif op["type"] == OP_ELSE:
            assert "jmp" in op.keys(), "no crossed referenced else error"
            ip = op["jmp"]
        elif op["type"] == OP_DURING:
            pass
        elif op["type"] == OP_GO:
            a = stack.pop()
            assert "jmp" in op.keys() , "no crossed referenced during go error"
            if a == 0:
                ip = op["jmp"]
        elif op["type"] == OP_END:
            if op["jmp"] != ip:
                ip = op["jmp"]
        elif op["type"] == OP_DUMP:
            a = stack.pop()
            print(a)
        elif op["type"] == OP_TRASH:
            stack.pop()
        elif op["type"] == OP_MEM:
            stack.append(STR_CAPACITY)
        elif op["type"] == OP_MEMREAD:
            addr = stack.pop()
            stack.append(rmem[addr])
        elif op["type"] == OP_MEMREAD16:
            addr = stack.pop()
            _bytes = bytearray(2)
            for offset in range(0,2):
                _bytes[offset] = rmem[addr + offset]
            stack.append(int.from_bytes(_bytes, byteorder="little"))
        elif op["type"] == OP_MEMREAD32:
            addr = stack.pop()
            _bytes = bytearray(4)
            for offset in range(0,4):
                _bytes[offset] = rmem[addr + offset]
            stack.append(int.from_bytes(_bytes, byteorder="little"))
        elif op["type"] == OP_MEMREAD64:
            addr = stack.pop()
            _bytes = bytearray(8)
            for offset in range(0,8):
                _bytes[offset] = rmem[addr + offset]
            stack.append(int.from_bytes(_bytes, byteorder="little"))
        elif op["type"] == OP_MEMWRITE:
            a = stack.pop()
            addr = stack.pop()
            rmem[addr] = a & 0xFF
        elif op["type"] == OP_MEMWRITE16:
            store_value = stack.pop()
            store_value64 = store_value.to_bytes(length=2, byteorder="little", signed=(store_value < 0))
            store_addr64 = stack.pop();
            for byte in store_value64:
                rmem[store_addr64] = byte;
                store_addr64 += 1;
        elif op["type"] == OP_MEMWRITE32:
            store_value = stack.pop()
            store_value64 = store_value.to_bytes(length=4, byteorder="little", signed=(store_value < 0))
            store_addr64 = stack.pop();
            for byte in store_value64:
                rmem[store_addr64] = byte;
                store_addr64 += 1;
        elif op["type"] == OP_MEMWRITE64:
            store_value = stack.pop()
            store_value64 = store_value.to_bytes(length=8, byteorder="little", signed=(store_value < 0))
            store_addr64 = stack.pop();
            for byte in store_value64:
                rmem[store_addr64] = byte;
                store_addr64 += 1;
        elif op["type"] == OP_CALL0:
            call = stack.pop()
            if call == 39:
                stack.append(os.getpid())
            else:
                assert False, "not implemented"
        elif op["type"] == OP_CALL1:
            call = stack.pop()
            arg1 = stack.pop()
            if call == 60:
                exit(arg1)
            else:
                assert False, "unkown syscall %d" % call
        elif op["type"] == OP_CALL2:
            assert False, "not implemented"
        elif op["type"] == OP_CALL3:
            call = stack.pop()
            arg1 = stack.pop()
            arg2 = stack.pop()
            arg3 = stack.pop()
            if call == 1:
                if arg1 == 1:
                    print(rmem[arg2:arg2+arg3].decode(), end='', file=sys.stdout)  # noqa
                elif arg1 == 2:
                    print(rmem[arg2:arg2+arg3].decode(), end='', file=sys.stderr)  # noqa
                else:
                    assert False, "unknown file descriptor %d" % arg1
                stack.append(arg3)
            else:
                assert False, "unkown syscall %d" % call
        elif op["type"] == OP_CALL4:
            assert False, "not implemented"
        elif op["type"] == OP_CALL5:
            assert False, "not implemented"
        elif op["type"] == OP_CALL6:
            assert False, "not implemented"
        elif op["type"] == OP_ARGC:
            stack.append(argc)
        elif op["type"] == OP_ARGV:
            stack.append(argptr)
        elif op["type"] == OP_SHR:
            a = stack.pop()
            b = stack.pop()
            stack.append(b >> a)
        elif op["type"] == OP_SHL:
            a = stack.pop()
            b = stack.pop()
            stack.append(b << a)
        elif op["type"] == OP_AND:
            a = stack.pop()
            b = stack.pop()
            stack.append(a & b)
        elif op["type"] == OP_OR:
            a = stack.pop()
            b = stack.pop()
            stack.append(a | b)
        elif op["type"] == OP_NOT:
            a = stack.pop()
            stack.append(~a)
        elif op["type"] == OP_XOR:
            a = stack.pop()
            b = stack.pop()
            stack.append(a ^ b)
        elif op["type"] == OP_STORESTR:
            bs = bytes(op["value"], "utf-8")
            n = len(bs)
            stack.append(n)
            if ip not in strptrs:
                str_ptr = strptr+strSize
                strptrs[ip] = str_ptr
                rmem[str_ptr:str_ptr+n] = bs
                strSize += n
                assert strSize <= STR_CAPACITY, "String Mem overflow"
            stack.append(strptrs[ip])
        elif op["type"] == OP_STORECSTR:
            bs = bytes(op["value"], "utf-8") + b'\0'
            n = len(bs)
            stack.append(n)
            if ip not in strptrs:
                str_ptr = strptr+strSize
                strptrs[ip] = str_ptr
                rmem[str_ptr:str_ptr+n] = bs
                strSize += n
                assert strSize <= STR_CAPACITY, "String Mem overflow"
            stack.append(strptrs[ip])
        elif op["type"] == OP_HERE:
            bs = bytes("%s:%d:%d" % op["loc"], "utf-8")
            n = len(bs)
            stack.append(n)
            if ip not in strptrs:
                str_ptr = strptr+strSize
                strptrs[ip] = str_ptr
                rmem[str_ptr:str_ptr+n] = bs
                strSize += n
                assert strSize <= STR_CAPACITY, "String Mem overflow"
            stack.append(strptrs[ip])
        elif op["type"] == OP_CAST_INT:
            pass
        elif op["type"] == OP_CAST_PTR:
            pass
        elif op["type"] == OP_CAST_BOOL:
            pass
        else:
            assert False, "Unknown operation |unreachable| %d" % op["type"]
        ip += 1
    if debug:
        print(rmem[STR_CAPACITY:20])


def cmpile(program, outfilePath):
    with open(outfilePath, "w") as f:
        f.write("[bits 64]\n")
        f.write("section .text\n")
        f.write(";    -- dump fucntion --\n")
        f.write("dump:\n")
        f.write("    sub rsp, 40\n")
        f.write("    mov ecx, 1\n")
        f.write("    mov r8d, 10\n")
        f.write("    mov BYTE [rsp+31], 10\n")
        f.write("    mov rsi, rsp\n")
        f.write("    lea r10, [rsp+31]\n")
        f.write(".L2:\n")
        f.write("    mov rax, rdi\n")
        f.write("    xor edx, edx\n")
        f.write("    mov r9, r10\n")
        f.write("    div r8\n")
        f.write("    sub r9, rcx\n")
        f.write("    inc rcx\n")
        f.write("    add edx, 48\n")
        f.write("    mov BYTE [r9], dl\n")
        f.write("    mov rdx, rdi\n")
        f.write("    mov rdi, rax\n")
        f.write("    cmp rdx, 9\n")
        f.write("    ja  .L2\n")
        f.write("    sub rsi, rcx\n")
        f.write("    mov rdx, rcx\n")
        f.write("    mov edi, 1\n")
        f.write("    add rsi, 32\n")
        f.write("    mov rax, 1\n")
        f.write("    syscall\n")
        f.write("    add rsp, 40\n")
        f.write("    ret\n\n")
        f.write("global _start\n")
        f.write("_start:\n")
        f.write("    mov [argv], rsp\n")
        strs = []
        for ip in range(len(program)):
            op = program[ip]
            assert COUNT_OP == 55, "Missing operation in compile switch"
            if op["type"] == OP_PUSH:
                f.write(";   -- push %d --\n" % op["value"])
                f.write("    mov rax, %d\n" % op["value"])
                f.write("    push rax\n")
            elif op["type"] == OP_DUP:
                f.write(";   -- dup --\n")
                f.write("    pop rax\n")
                f.write("    push rax\n")
                f.write("    push rax\n")
            elif op["type"] == OP_SWAP:
                f.write(";   -- swap --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    push rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_ROTATE:
                f.write(";   -- rotate --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    pop rcx\n")
                f.write("    push rbx\n")
                f.write("    push rax\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_OVER:
                f.write(";   -- over --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    push rbx\n")
                f.write("    push rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_PLUS:
                f.write(";   -- plus --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    add rax, rbx\n")
                f.write("    push rax\n")
            elif op["type"] == OP_MINUS:
                f.write(";   -- minus --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    sub rbx, rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_MUL:
                f.write(";   -- multiplication --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    mul rbx\n")
                f.write("    push rax\n")
            elif op["type"] == OP_DIV:
                f.write(";   -- division --\n")
                f.write("    xor rdx, rdx\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    div rbx\n")
                f.write("    push rax\n")
            elif op["type"] == OP_MOD:
                f.write(";   -- modulo --\n")
                f.write("    xor rdx, rdx\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    div rbx\n")
                f.write("    push rdx\n")
            elif op["type"] == OP_EQUAL:
                f.write(";   -- equal --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmove rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_GREATER:
                f.write(";   -- greater --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmovg rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_LESS:
                f.write(";   -- less --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmovl rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_GEQ:
                f.write(";   -- greater or equal --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmovge rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_LEQ:
                f.write(";   -- less or equal --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmovle rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_NEQ:
                f.write(";   -- less or equal --\n")
                f.write("    mov rcx, 0\n")
                f.write("    mov rdx, 1\n")
                f.write("    pop rbx\n")
                f.write("    pop rax\n")
                f.write("    cmp rax, rbx\n")
                f.write("    cmovne rcx, rdx\n")
                f.write("    push rcx\n")
            elif op["type"] == OP_IF:
                f.write(";   -- if --\n")
            elif op["type"] == OP_ELSE:
                assert "jmp" in op.keys(), "no crossed referenced else error"
                f.write(";   -- else --\n")
                f.write("    jmp .go%d\n" % op["jmp"])
                f.write(".go%d:\n" % ip)
            elif op["type"] == OP_DURING:
                f.write(";   -- during --\n")
                f.write(".go%d:\n" % ip)
            elif op["type"] == OP_GO:
                assert "jmp" in op.keys(), "no crossed referenced go error"
                f.write(";   -- go --\n")
                f.write("    pop rax\n")
                f.write("    test rax, rax\n")
                f.write("    jz .go%d\n" % op["jmp"])
            elif op["type"] == OP_END:
                assert "jmp" in op.keys(), "no crossed referenced end error"
                f.write(";   -- end --\n")
                if op["jmp"] != ip:
                    f.write("    jmp .go%d\n" % op["jmp"])
                f.write(".go%d:\n" % ip)
            elif op["type"] == OP_DUMP:
                f.write(";   -- dump --\n")
                f.write("    pop rdi\n")
                f.write("    call dump\n")
            elif op["type"] == OP_TRASH:
                f.write(";   -- trash --\n")
                f.write("    pop rax\n")
            elif op["type"] == OP_MEM:
                f.write(";   -- mem --\n")
                f.write("    push rmem\n")
            elif op["type"] == OP_MEMREAD:
                f.write(";   -- mem read --\n")
                f.write("    pop rax\n")
                f.write("    xor rbx, rbx\n")
                f.write("    mov bl, byte [rax]\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_MEMREAD16:
                f.write(";   -- mem read --\n")
                f.write("    pop rax\n")
                f.write("    xor rbx, rbx\n")
                f.write("    mov bx, word [rax]\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_MEMREAD32:
                f.write(";   -- mem read --\n")
                f.write("    pop rax\n")
                f.write("    xor rbx, rbx\n")
                f.write("    mov ebx, dword [rax]\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_MEMREAD64:
                f.write(";   -- mem read --\n")
                f.write("    pop rax\n")
                f.write("    xor rbx, rbx\n")
                f.write("    mov rbx, qword [rax]\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_MEMWRITE:
                f.write(";   -- mem write --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    mov byte [rbx], al\n")
            elif op["type"] == OP_MEMWRITE16:
                f.write(";   -- mem write --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    mov word [rbx], ax\n")
            elif op["type"] == OP_MEMWRITE32:
                f.write(";   -- mem write --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    mov dword [rbx], eax\n")
            elif op["type"] == OP_MEMWRITE64:
                f.write(";   -- mem write --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    mov qword [rbx], rax\n")
            elif op["type"] == OP_CALL0:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL1:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL2:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    pop rsi\n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL3:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    pop rsi\n")
                f.write("    pop rdx\n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL4:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    pop rsi\n")
                f.write("    pop rdx\n")
                f.write("    pop r10\n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL5:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    pop rsi\n")
                f.write("    pop rdx\n")
                f.write("    pop r10\n")
                f.write("    pop r8 \n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_CALL6:
                f.write(";   -- call --\n")
                f.write("    pop rax\n")
                f.write("    pop rdi\n")
                f.write("    pop rsi\n")
                f.write("    pop rdx\n")
                f.write("    pop r10\n")
                f.write("    pop r8 \n")
                f.write("    pop r9 \n")
                f.write("    syscall\n")
                f.write("    push rax\n")
            elif op["type"] == OP_ARGC:
                f.write(";   -- argc --\n")
                f.write("    mov qword rax, [argv]\n")
                f.write("    push qword [rax]\n")
            elif op["type"] == OP_ARGV:
                f.write(";   -- argv --\n")
                f.write("    mov qword rax, [argv]\n")
                f.write("    add rax, 8\n")
                f.write("    push rax\n")
            elif op["type"] == OP_SHR:
                f.write(";   -- shr --\n")
                f.write("    pop rcx\n")
                f.write("    pop rbx\n")
                f.write("    shr rbx, cl\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_SHL:
                f.write(";   -- shr --\n")
                f.write("    pop rcx\n")
                f.write("    pop rbx\n")
                f.write("    shl rbx, cl\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_AND:
                f.write(";   -- and --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    and rbx, rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_OR:
                f.write(";   -- and --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    or rbx, rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_NOT:
                f.write(";   -- and --\n")
                f.write("    pop rax\n")
                f.write("    not rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_XOR:
                f.write(";   -- and --\n")
                f.write("    pop rax\n")
                f.write("    pop rbx\n")
                f.write("    xor rbx, rax\n")
                f.write("    push rbx\n")
            elif op["type"] == OP_STORESTR:
                val = bytes(op["value"], "utf-8")
                f.write(";   -- string litteral --\n")
                f.write("    push %d\n" % len(op["value"]))
                f.write("    push str%d\n" % len(strs))
                strs.append(val)
            elif op["type"] == OP_STORECSTR:
                val = bytes(op["value"], "utf-8") + b'\0'
                f.write(";   -- string c litteral --\n")
                f.write("    push str%d\n" % len(strs))
                strs.append(val)
            elif op["type"] == OP_HERE:
                v = "%s:%d:%d" % op["loc"]
                val = bytes(v, "utf-8")
                f.write(";   -- string litteral --\n")
                f.write("    push %d\n" % len(v))
                f.write("    push str%d\n" % len(strs))
                strs.append(val)
            elif op["type"] == OP_CAST_INT:
                f.write(";   -- cast to int --\n")
                pass
            elif op["type"] == OP_CAST_PTR:
                f.write(";   -- cast to ptr --\n")
                pass
            elif op["type"] == OP_CAST_BOOL:
                f.write(";   -- cast to bool --\n")
                pass
            else:
                assert False, "Unknown operation |unreachable|"
        f.write("\n")
        f.write("    mov rdi, 1\n")
        f.write("    mov rax, 60\n")
        f.write("    syscall")
        f.write("\n")
        f.write("section .data\n")
        for index, s in enumerate(strs):
            f.write("str%d: \n" % index)
            f.write("    db %s\n" % ','.join(map(hex, list(s))))  # noqa
        f.write("section .bss\n")
        f.write("rmem: resb %d\n" % MEM_CAPACITY)
        f.write("argv: resq 1\n")


def usage(program):
    print("USAGE : " + program + " [OPTION] <SUBCOMMAND> [ARGS]")
    print()
    print()
    print("OPTION")
    print("    -I | --include <directory>    add one include directory to include directory list")
    print("    -l | --limit <n>              set macro depth limit to n (default=1000)")
    print("    -L | --lex-analysis           analyse your code without compiling or simulating it")
    print("    -u | --unsafe                 disable type checking")
    print("    -d | --debug                  add debug information")
    print()
    print()
    print("SUBCOMMAND")
    print("    -c | --compile [clean|run|graph]  <file>    Compile  the program")
    print("    -s | --simulate <file>                      Simulate the program")
    print("    -h | --help                                 Show this help")


def callCmd(cmd):
    print(" + " + cmd)
    sp.call(cmd.split(' '))


def popFirst(lst):
    return (lst[0], lst[1:])


def findCol(line, col, predicate):
    while col < len(line) and not predicate(line[col]):
        col += 1
    return col

def find_string_literal_end(line: str, start: int) -> int:
    prev = line[start]
    while start < len(line):
        curr = line[start]
        if curr == '"' and prev != '\\':
            break
        prev = curr
        start += 1
    return start

def unescape_string(s):
    return s.encode('utf-8').decode('unicode_escape').encode('latin-1').decode('utf-8')

def lexLine(lines, file):
    assert COUNT_TOK == 5, "Missing Token in Lexer"
    row = 0
    str_literal_buf = ""
    while row < len(lines):
        line = lines[row]
        col = findCol(line, 0, lambda x: not x.isspace())
        col_end = 0
        while col < len(line):
            loc = (file, row + 1, col + 1)
            if line[col] == '"':
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
                        print("%s:%d:%d: ERROR: unclosed string literal" % loc, file=sys.stderr)
                        exit(1)
                    assert line[col_end] == '"'
                    col_end += 1
                    text_of_token = str_literal_buf
                    str_literal_buf = ""
                    if col_end < len(line) and line[col_end] == 'C':
                        col_end += 1
                        yield {"type": TOK_CSTR, "value": unescape_string(text_of_token), "loc": loc, "expanded": 0}
                    else:
                        yield {"type": TOK_STR, "value": unescape_string(text_of_token), "loc": loc, "expanded": 0}
                    col = findCol(line, col_end, lambda x: not x.isspace())
            elif line[col] == "'":
                col_end = findCol(line, col+1, lambda x: x == "'")
                if col_end >= len(line) or line[col_end] != "'":
                    print("%s:%d:%d: ERROR: unclosed character literal" % loc, file=sys.stderr)
                    exit(1)
                char_bytes = unescape_string(line[col+1:col_end]).encode('utf-8')
                if len(char_bytes) != 1:
                    print("%s:%d:%d: ERROR: only a single byte is allowed inside of a character literal" % loc, file=sys.stderr)
                    exit(1)
                yield {"type": TOK_CHAR, "value": char_bytes[0], "loc": loc, "expanded": 0}
                col = findCol(line, col_end+1, lambda x: not x.isspace())
            else:
                col_end = findCol(line, col, lambda x: x.isspace())
                text_of_token = line[col:col_end]
                try:
                    yield {"type": TOK_INT, "value": int(text_of_token), "loc": loc, "expanded": 0}
                except ValueError:
                    if text_of_token.startswith("//"):
                        break
                    yield {"type": TOK_WORD, "value": text_of_token, "loc": loc, "expanded": 0}
                col = findCol(line, col_end, lambda x: not x.isspace())
        row += 1

def lex(file, e = 0):
    with open(file, "r") as f:
        result = [tok for tok in lexLine(f.readlines(), file)]
        for tok in result:
            tok["expanded"] = e
        return result

assert COUNT_OP == 55, "Missing operation in KEYWORD dict"
KEYWORDS = {
    "+": OP_PLUS,
    "-": OP_MINUS,
    "*": OP_MUL,
    "/": OP_DIV,
    "%": OP_MOD,
    "dup": OP_DUP,
    "<>": OP_SWAP,
    "<+>": OP_OVER,
    "<->": OP_ROTATE,
    "dump": OP_DUMP,
    "=": OP_EQUAL,
    ">": OP_GREATER,
    "<": OP_LESS,
    "=>": OP_GEQ,
    ">=": OP_GEQ,
    "<=": OP_LEQ,
    "=<": OP_LEQ,
    "!=": OP_NEQ,
    "if": OP_IF,
    "else": OP_ELSE,
    "during": OP_DURING,
    "go": OP_GO,
    "end": OP_END,
    "_": OP_TRASH,
    "mem": OP_MEM,
    ".": OP_MEMWRITE,
    ".16": OP_MEMWRITE16,
    ".32": OP_MEMWRITE32,
    ".64": OP_MEMWRITE64,
    ",": OP_MEMREAD,
    ",16": OP_MEMREAD16,
    ",32": OP_MEMREAD32,
    ",64": OP_MEMREAD64,
    "call0": OP_CALL0,
    "call1": OP_CALL1,
    "call2": OP_CALL2,
    "call3": OP_CALL3,
    "call4": OP_CALL4,
    "call5": OP_CALL5,
    "call6": OP_CALL6,
    "#c": OP_ARGC,
    "#v": OP_ARGV,
    ">>": OP_SHR,
    "<<": OP_SHL,
    "&": OP_AND,
    "|": OP_OR,
    "~": OP_NOT,
    "^": OP_XOR,
    "define": OP_DEFINE,
    "addin": OP_ADDIN,
    "!?!": OP_HERE,
    "@ptr": OP_CAST_PTR,
    "@int": OP_CAST_INT,
    "@bool": OP_CAST_BOOL,
}


def humanNameTok(type):
    if type == TOK_WORD:
        return "keyword"
    elif type == TOK_INT:
        return "integer litteral"
    elif type == TOK_STR:
        return "string litteral"
    elif type == TOK_CSTR:
        return "c string litteral"
    elif type == TOK_CHAR:
        return "character litteral"
    else:
        assert False, "human |unreachable|"

def expand_macro(m, e):
    result = list(map(copy, m["body"]))
    for tok in result:
        tok["expanded_from"] = e
        tok["expanded"] = e["expanded"] + 1
    return result

def blocksCrossRef(tokLst):
    stack = []
    program = []
    rtok = list(reversed(tokLst))
    ip = 0
    macros = {}
    assert COUNT_OP == 55, "Missing operation in cross reference switch"
    while len(rtok) > 0:
        word = rtok.pop()
        typ = word["type"]
        token = word["value"]
        loc = word["loc"]
        op = None
        if(debug):
            print("[DEBUG] %s:%d:%d -> value : %s, type : %s" % (loc + (token, humanNameTok(typ))))
        assert COUNT_TOK == 5, "Missing Token in Parser"
        if typ == TOK_INT:
            op = {"type": OP_PUSH, "value": token, "loc": loc, "token": word}
        elif typ == TOK_STR:
            op = {"type": OP_STORESTR, "value": token, "loc": loc, "token": word}
        elif typ == TOK_CSTR:
            op = {"type": OP_STORECSTR, "value": token, "loc": loc, "token": word}
        elif typ == TOK_CHAR:
            op = {"type": OP_PUSH, "value": token, "loc": loc, "token": word}
        elif typ == TOK_WORD:
            if token in KEYWORDS:
                op = {"type": KEYWORDS[token], "loc": loc, "token": word}
            elif token in macros:
                if(word["expanded"] >= expantion_limit):
                    print("[ERROR] %s:%d:%d -> macro exceeded expansion limit (%d)" % (loc + (expantion_limit, )))
                    exit(1)
                rtok += reversed(expand_macro(macros[token], word))
                continue
            else:
                print("[ERROR] %s:%d:%d -> unknown keyword : %s" % (loc + (token, )))  # noqa
                compiler_diagnostic_expand(word)
                exit(1)
        else:
            assert False, "unreachable"
        if op["type"] == OP_IF:
            program.append(op)
            stack.append(ip)
            ip += 1
        elif op["type"] == OP_ELSE:
            program.append(op)
            goa = stack.pop()
            if program[goa]["type"] != OP_GO:
                print("[ERROR] in %s:%d:%d -> else keyword can only close if-go conditions" % program[goa]["loc"])  # noqa
                exit(1)
            ifa = program[goa]["jmp"]
            if program[goa]["type"] != OP_GO:
                print("[ERROR] in %s:%d:%d -> else keyword can only close if-go conditions" % program[ifa]["loc"])  # noqa
                exit(1)
            program[goa]["jmp"] = ip
            stack.append(ip)
            ip += 1
        elif op["type"] == OP_DURING:
            program.append(op)
            stack.append(ip)
            ip += 1
        elif op["type"] == OP_GO:
            program.append(op)
            addr = stack.pop()
            program[ip]["jmp"] = addr
            stack.append(ip)
            ip += 1
        elif op["type"] == OP_END:
            program.append(op)
            addr = stack.pop()
            if program[addr]["type"] == OP_ELSE:  # noqa
                program[addr]["jmp"] = ip
                program[ip]["jmp"] = ip
            elif program[addr]["type"] == OP_GO:
                if not "jmp" in program[addr].keys():
                    print("[ERROR] %s:%d:%d -> go does not have a block attached" % program[addr]["loc"])  # noqa
                    exit(1)
                addrid = program[addr]["jmp"]
                if program[addrid]["type"] == OP_IF:
                    program[ip]["jmp"] = ip
                    program[addr]["jmp"] = ip
                elif program[addrid]["type"] == OP_DURING:
                    program[ip]["jmp"] = addrid
                    program[addr]["jmp"] = ip
                else:
                    print("[ERROR] in %s:%d:%d -> end does not have a valid block attached" % program[addr]["loc"])  # noqa
                    exit(1)
            elif program[addr]["type"] == OP_IF:
                    print("[ERROR] in %s:%d:%d -> end need to be if <cond> go block attached" % program[addr]["loc"])  # noqa
                    exit(1)
            else:
                assert False, "unreachable cross references"
            ip += 1
        elif op["type"] == OP_DEFINE:
            if len(rtok) == 0:
                print("[ERROR] %s:%d:%d -> exepted macro definition" % op["loc"])  # noqa
                exit(1)
            name = rtok.pop()
            if not name["type"] == TOK_WORD:
                print("[ERROR] %s:%d:%d -> Macros name can not be : %s" % (name["loc"] + (humanNameTok(name["type"]), )))  # noqa
                exit(1)
            if name["value"] in KEYWORDS:
                print("[ERROR] %s:%d:%d -> Unable to redifine keyword : %s" % (name["loc"] + (name["value"], )))  # noqa
                exit(1)
            if name["value"] in macros:
                print("[ERROR] %s:%d:%d -> Unable to redifine macro  : %s" % (name["loc"] + (name["value"], )))  # noqa
                print("[INFO]  %s:%d:%d -> first definition of macro : %s" % (macros[name["value"]]["loc"] + (name["value"], )))  # noqa
                exit(1)
            m = {"loc": op["loc"], "body": []}
            tok = {}
            nest = 0
            while len(rtok) > 0:
                tok = rtok.pop()
                if tok["type"] == TOK_WORD and tok["value"] == "end":
                    if nest == 0:
                        if debug:
                            print("!!!!!!!!!  end of macro %s !!!!!!!!!" % name["value"])
                        break
                    else:
                        m["body"].append(tok)
                        if debug:
                            print("[DEBUG] n-1 -> ", tok, " => nesting : ", nest)
                        nest -= 1
                else:
                    if tok["value"] in ["if", "during", "define"]:
                        if debug:
                            print("[DEBUG] n+1 -> ", tok, " => nesting : ", nest)
                        nest += 1
                    m["body"].append(tok)
            if tok["type"] != TOK_WORD or tok["value"] != "end":
                print("[ERROR] %s:%d:%d -> open macro that has not been closed" % tok["loc"])  # noqa
                exit(1)
            if debug:
                print("[INFO]  %s:%d:%d -> New macro definition : %s" % (m["loc"] + (name["value"], )))  # noqa
            macros[name["value"]] = m
        elif op["type"] == OP_ADDIN:
            if len(rtok) == 0:
                print("[ERROR] %s:%d:%d -> expected path to include file but founded nothing" % op["loc"])  # noqa
                exit(1)
            incFilePath = rtok.pop()
            if incFilePath["type"] != TOK_STR:
                print("[ERROR] %s:%d:%d -> expected path to include file but founded %s" % (op["loc"] + (humanNameTok(incFilePath["type"]), )))  # noqa
                exit(1)
            file_included = False
            for ipt in ipath:
                try:
                    if(word["expanded"] >= expantion_limit):
                        print("[ERROR] %s:%d:%d -> addin exceeded expansion limit (%d)" % (loc + (expantion_limit, )))
                        exit(1)
                    rtok += reversed(lex(path.join(ipt, incFilePath["value"] + ".thrt"), word["expanded"] + 1))
                    file_included = True
                    break;
                except FileNotFoundError:
                    continue
            if not file_included:
                print("[ERROR] %s:%d:%d -> file %s not founded" % (op["loc"] + (incFilePath["value"] + ".thrt", )))  # noqa
                exit(1)
        else:
            program.append(op)
            ip += 1
    if stack:
        print("[ERROR] -> founded opened block that haven't been closed")
        exit(1)
    return program

def genCFGraph(program, path, clean):
    print("[INFO] -> adding dot graph as debug informations")
    with open(path + ".dot", "w") as f:
        f.write("digraph program {\n")
        f.write("    entryPoint [shape=record];\n")
        f.write("    entryPoint [label=\"Entry Point\"];\n")
        f.write("    entryPoint -> N0;\n")
        for ip in range(len(program)):
            op = program[ip]
            if op["type"] == OP_PUSH:
                f.write("    N%d [label=%d];\n" % (ip, op["value"]))
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_STORESTR:
                f.write("    N%d [label=%s];\n" % (ip, repr(repr(op["value"]))))
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_STORECSTR:
                f.write("    N%d [label=%s];\n" % (ip, repr(repr(op["value"]))))
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_IF:
                f.write("    N%d [shape=octagon label=if fillcolor=azure3 style=filled];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_DURING:
                f.write("    N%d [shape=octagon label=during fillcolor=azure3 style=filled];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_GO:
                assert "jmp" in op.keys(), "[ERROR] -> go with no valid block"
                f.write("    N%d [shape=diamond label=go fillcolor=aqua style=filled];\n" % ip)
                f.write("    N%d -> N%d [label=true];\n" % (ip, ip + 1))
                f.write("    N%d -> N%d [label=false arrowhead=dot style=dashed];\n" % (ip, op["jmp"] + 1))
            elif op["type"] == OP_END:
                assert "jmp" in op.keys(), "[ERROR] -> end with no valid block"
                f.write("    N%d [shape=triangle label=end fillcolor=black style=filled fontcolor=white];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, op["jmp"] + 1))
            elif op["type"] == OP_CAST_PTR:
                f.write("    N%d [label=\"to pointer\" shape=invhouse fillcolor=burlywood1 style=filled];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_CAST_INT:
                f.write("    N%d [label=\"to int\" shape=invhouse fillcolor=burlywood1 style=filled];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            elif op["type"] == OP_CAST_BOOL:
                f.write("    N%d [label=\"to bool\" shape=invhouse fillcolor=burlywood1 style=filled];\n" % ip)
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
            else:
                f.write("    N%d [label=%s];\n" % (ip, repr(repr(operations[op["type"]]))))
                f.write("    N%d -> N%d;\n" % (ip, ip + 1))
        f.write("    N%d [label=Halt fillcolor=crimson style=filled];\n" % len(program))
        f.write("    N%d [shape=record];\n" % len(program))
        f.write("}\n")
    callCmd("dot -Tsvg " + path + ".dot -o " + path + ".svg")
    if clean:
        callCmd("rm -rf " + path + ".dot")

if __name__ == "__main__":
    argv = sys.argv
    assert len(argv) >= 1, "[ERROR] -> no argument where given during program launching"  # noqa
    (program, argv) = popFirst(argv)
    lexOnly = False
    if len(argv) < 1:
        usage(program)
        print("\n\n[ERROR] -> no subcommand provided")
        exit(1)
    while len(argv) > 0:
        if argv[0] == "-d" or argv[0] == "--debug":
            argv = argv[1:]
            debug = True
        elif argv[0] == "-I" or argv[0] == "--include":
            argv = argv[1:]
            if len(argv) == 0:
                usage(program)
                print("[ERROR] -> no include path provided")
                exit(1)
            (incl, argv) = popFirst(argv)
            ipath.append(incl)
        elif argv[0] == "-u" or argv[0] == "--unsafe":
            argv = argv[1:]
            unsafe = True
        elif argv[0] == "-L" or argv[0] == "--lex-analysis":
            argv = argv[1:]
            lexOnly = True
        elif argv[0] == '-l' or argv[0] == "--limit":
            argv = argv[1:]
            if len(argv) == 0:
                usage(program)
                print("[ERROR] -> no macro depth limit provided")
                exit(1)
            (arg, argv) = popFirst(argv)
            try:
                expantion_limit = int(arg)
            except ValueError:
                usage(program)
                print("[ERROR] -> macro depth limit provided is not an integer")
                exit(1)
        else:
            break
    if lexOnly:
        if len(argv) == 0:
            usage(program)
            print("[ERROR] -> no file to lex provided")
            exit(1)
        toLx, argv = popFirst(argv)
        prog = blocksCrossRef(lex(toLx))
        if not unsafe:
            typecheck(prog)
        print("your program is correct no error founded")
        exit(0)
    (cmd, argv) = popFirst(argv)
    if cmd == "-h" or cmd == "--help":
        usage(program)
        exit(0)
    elif cmd == "-s" or cmd == "--simulate":
        if len(argv) < 1:
            usage(program)
            print("\n\n[ERROR] -> no file provided for simulation")
            exit(1)
        (inputFile, argv) = popFirst(argv)
        parsedProg = blocksCrossRef(lex(inputFile))
        if not unsafe:
            typecheck(parsedProg)
        simulate(parsedProg, [inputFile] + argv)
    elif cmd == "-c" or cmd == "--compile":
        rmb = False
        run = False
        grp = False
        inputFile = None
        if len(argv) < 1:
            usage(program)
            print("\n\n[ERROR] -> no file provided for compilation")
            exit(1)
        elif len(argv) > 1:
            (rm, argv) = popFirst(argv)
            if len(argv) >= 2:
                if len(argv) >= 3:
                    if rm == "clean":
                        rmb = True
                    elif rm == "run":
                        run = True
                    elif rm == "graph":
                        grp = True
                    (rm, argv) = popFirst(argv)
                if rm == "clean":
                    rmb = True
                    (rm, argv) = popFirst(argv)
                elif rm == "run":
                    run = True
                    (rm, argv) = popFirst(argv)
                elif rm == "graph":
                    grp = True
                    (rm, argv) = popFirst(argv)
            if rm == "clean":
                rmb = True
            elif rm == "run":
                run = True
            elif rm == "graph":
                grp = True
            else:
                inputFile = rm
        if inputFile == None:
            (inputFile, argv) = popFirst(argv)
        parsedProg = blocksCrossRef(lex(inputFile))
        basedir = path.dirname(inputFile)
        if basedir == "":
            basedir = os.getcwd()
        outBin = path.join(basedir, path.basename(inputFile).split('.')[0])
        outFile = outBin + ".asm"
        outObj = outBin + ".o"
        if not unsafe:
            typecheck(parsedProg)
        if grp:
            genCFGraph(parsedProg, outBin, rmb)
        cmpile(parsedProg, outFile)
        callCmd("nasm -felf64 " + outFile)
        callCmd("ld -o " + outBin + " " + outObj)
        if rmb:
            callCmd("rm -rf " + outFile + " " + outObj)
        if run:
            callCmd(outBin + ' ' + ' '.join(argv))
    else:
        assert False, "unreachable"
