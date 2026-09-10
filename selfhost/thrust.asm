BITS 64
segment .text
global _start
_start:
    mov [args_ptr], rsp
    mov rax, ret_stack_end
    mov [ret_stack_rsp], rax
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call main
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    pop qword rdi
    mov rax, 60
    syscall
    ;; -- func --
global isrange
isrange:
    ;; -- stack prep --
    sub rsp, 8
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- func --
global strSuffix
strSuffix:
    ;; -- stack prep --
    sub rsp, 48
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 40
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_60
    ;; -- push bool 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 48
    ret
    ;; -- end --
addr_60:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 40
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- while --
addr_79:
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 40
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_114
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- end --
    jmp addr_79
addr_114:
    mov rax, [ret_stack_rsp]
    add rax, 32
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 48
    ret
    ;; -- func --
global strtrimLeft
strtrimLeft:
    ;; -- stack prep --
    sub rsp, 16
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- while --
addr_135:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 9 --
    mov rax, 9
    push rax
    ;; -- push int 5 --
    mov rax, 5
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call isrange
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- bor --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_164
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- end --
    jmp addr_135
addr_164:
    ;; -- if --
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_183
    ;; -- drop --
    pop rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- elif --
    jmp addr_197
addr_183:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_197
    ;; -- drop --
    pop rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- end --
addr_197:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- func --
global strtrimRight
strtrimRight:
    ;; -- stack prep --
    sub rsp, 16
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    ;; -- while --
addr_249:
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 9 --
    mov rax, 9
    push rax
    ;; -- push int 5 --
    mov rax, 5
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call isrange
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- bor --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_274
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    ;; -- end --
    jmp addr_249
addr_274:
    ;; -- if --
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_285
    ;; -- drop --
    pop rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- elif --
    jmp addr_307
addr_285:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_307
    ;; -- drop --
    pop rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- end --
addr_307:
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- func --
global strtrim
strtrim:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call strtrimLeft
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call strtrimRight
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global cstrlen
cstrlen:
    ;; -- stack prep --
    sub rsp, 8
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_343
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_343:
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- while --
addr_344:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_357
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- end --
    jmp addr_344
addr_357:
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- func --
global cstrToStr
cstrToStr:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call cstrlen
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global strtoCstr
strtoCstr:
    ;; -- stack prep --
    sub rsp, 16
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    ;; -- func --
global read
read:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global write
write:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global open
open:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global close
close:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 3 --
    mov rax, 3
    push rax
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global mmap
mmap:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 9 --
    mov rax, 9
    push rax
    ;; -- syscall6 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    pop r10
    pop r8
    pop r9
    syscall
    push rax
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global munmap
munmap:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 11 --
    mov rax, 11
    push rax
    ;; -- syscall2 --
    pop rax
    pop rdi
    pop rsi
    syscall
    push rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global exit
exit:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 60 --
    mov rax, 60
    push rax
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global puts
puts:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call write
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global eputs
eputs:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call write
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global gets
gets:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call read
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global main
main:
    ;; -- stack prep --
    sub rsp, 16
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 13
    push rax
    push str_0
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call strtrim
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_463
    ;; -- push str --
    mov rax, 9
    push rax
    push str_1
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- else --
    jmp addr_480
addr_463:
    ;; -- push str --
    mov rax, 1
    push rax
    push str_2
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(int) --
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 2
    push rax
    push str_3
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- end --
addr_480:
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 16
    ret
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x20,0x20,0x9,0x20,0x20,0x20,0x20,0x20,0x20,0xa,0x20,0x20,0x20
str_1: db 0x6c,0x65,0x6e,0x20,0x69,0x73,0x20,0x30,0xa
str_2: db 0x7c
str_3: db 0x7c,0xa
segment .bss
global args_ptr
args_ptr: resq 1
global ret_stack_rsp
ret_stack_rsp: resq 1
global ret_stack
ret_stack: resq 4096
global ret_stack_end
ret_stack_end:
