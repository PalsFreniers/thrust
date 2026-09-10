BITS 64
segment .text
global _start
_start:
    mov [args_ptr], rsp
    mov rax, ret_stack_end
    mov [ret_stack_rsp], rax
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call init
    call main
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    pop qword rdi
    mov rax, 60
    syscall
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
    jz addr_13
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_13:
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- while --
addr_14:
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
    jz addr_27
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- end --
    jmp addr_14
addr_27:
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
global Arena_new
Arena_new:
    ;; -- stack prep --
    sub rsp, 40
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 8
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
    ;; -- push int 24 --
    mov rax, 24
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
    ;; -- push int 16 --
    mov rax, 16
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
    ;; -- push int -1 --
    mov rax, -1
    push rax
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- bor --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- bor --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 8
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
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
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
    ;; -- cast(ptr) --
    ;; -- push ptr 0 --
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
    jz addr_111
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 40
    ret
    ;; -- end --
addr_111:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 8
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
    add rax, 8
    push rax
    ;; -- push int 16 --
    mov rax, 16
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
    add rax, 8
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
    ;; -- dup --
    pop rax
    push rax
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
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 16 --
    mov rax, 16
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
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 24 --
    mov rax, 24
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
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
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
    ;; -- push int 24 --
    mov rax, 24
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
    ;; -- push int 16 --
    mov rax, 16
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
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 40
    ret
    ;; -- func --
global Arena_zero
Arena_zero:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global Arena_free
Arena_free:
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
    ;; -- cast(ptr) --
    ;; -- push ptr 0 --
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
    jz addr_193
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_193:
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
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
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_206
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_206:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- push int 24 --
    mov rax, 24
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
    call Arena_free
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
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
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
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
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
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
    add rsp, 8
    ret
    ;; -- func --
global Arena_alloc
Arena_alloc:
    ;; -- stack prep --
    sub rsp, 24
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
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
    add rax, 16
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
    ;; -- cast(ptr) --
    ;; -- push ptr 0 --
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
    jz addr_260
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 24
    ret
    ;; -- end --
addr_260:
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- push int 16 --
    mov rax, 16
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
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_308
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
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
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_302
    mov rax, [ret_stack_rsp]
    add rax, 8
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
    add rax, 16
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- end --
addr_302:
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call Arena_new
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- end --
addr_308:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- push int 16 --
    mov rax, 16
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
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- push int 16 --
    mov rax, 16
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
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 24
    ret
    ;; -- func --
global malloc
malloc:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push mem --
    mov rax, mem
    add rax, 0
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
    call Arena_alloc
    mov [ret_stack_rsp], rsp
    mov rsp, rax
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
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call Arena_free
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
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global putchar
putchar:
    ;; -- stack prep --
    sub rsp, 1
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
    ;; -- push int 1 --
    mov rax, 1
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 1
    ret
    ;; -- func --
global putu
putu:
    ;; -- stack prep --
    sub rsp, 32
    mov [ret_stack_rsp], rsp
    mov rsp, rax
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
    jz addr_375
    ;; -- push str --
    mov rax, 1
    push rax
    push str_0
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 32
    ret
    ;; -- end --
addr_375:
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- while --
addr_378:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_401
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 10 --
    mov rax, 10
    push rax
;   -- division --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 10 --
    mov rax, 10
    push rax
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 48 --
    mov rax, 48
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- store --
    pop rax
    pop rbx
    mov [rax], bl
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- end --
    jmp addr_378
addr_401:
    ;; -- dup --
    pop rax
    push rax
    push rax
    mov rax, [ret_stack_rsp]
    add rax, 0
    push rax
    ;; -- push int 32 --
    mov rax, 32
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
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
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- drop --
    pop rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 32
    ret
    ;; -- func --
global putd
putd:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- if --
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
    cmovl rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_424
    ;; -- push int 0 --
    mov rax, 0
    push rax
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
    ;; -- push str --
    mov rax, 1
    push rax
    push str_1
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call puts
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- end --
addr_424:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call putu
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
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
    jz addr_476
    ;; -- push bool 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 48
    ret
    ;; -- end --
addr_476:
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
addr_495:
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
    jz addr_530
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
    jmp addr_495
addr_530:
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
global init
init:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 4000 --
    mov rax, 4000
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call Arena_new
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push mem --
    mov rax, mem
    add rax, 0
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global isAscii
isAscii:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
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
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push int 127 --
    mov rax, 127
    push rax
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global isSpace
isSpace:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 9 --
    mov rax, 9
    push rax
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- push int 13 --
    mov rax, 13
    push rax
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
    ;; -- band --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
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
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    ;; -- func --
global main
main:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- rot --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call putd
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call putd
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call putd
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x30
str_1: db 0x2d
segment .bss
global args_ptr
args_ptr: resq 1
global ret_stack_rsp
ret_stack_rsp: resq 1
global ret_stack
ret_stack: resq 4096
global ret_stack_end
ret_stack_end:
mem: resb 8
