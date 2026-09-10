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
    add rax, 0
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
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
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- dup --
    pop rax
    push rax
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
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
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
    jz addr_131
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_131:
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
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
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
    cmovle rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_141
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 8
    ret
    ;; -- end --
addr_141:
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
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
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
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
    jz addr_193
    ;; -- push ptr 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 24
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    jz addr_240
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
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
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
    cmovle rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_234
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
addr_234:
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
addr_240:
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    jz addr_311
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
addr_311:
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
addr_314:
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
    jz addr_337
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
    jmp addr_314
addr_337:
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
    jz addr_360
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
addr_360:
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
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
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
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
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
    jz addr_405
    ;; -- push bool 0 --
    mov rax, 0
    push rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 48
    ret
    ;; -- end --
addr_405:
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
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 16
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
addr_420:
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
    jz addr_452
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
    jmp addr_420
addr_452:
    ;; -- if --
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
    ;; -- push bool 1 --
    mov rax, 1
    push rax
    ;; -- else --
    jmp addr_465
addr_463:
    ;; -- push bool 0 --
    mov rax, 0
    push rax
    ;; -- end --
addr_465:
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
global usage
usage:
    ;; -- stack prep --
    sub rsp, 32
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
    add rax, 16
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    mov rax, [ret_stack_rsp]
    add rax, 24
    push rax
    ;; -- store64 --
    pop rax
    pop rbx
    mov [rax], rbx
    ;; -- push str --
    mov rax, 7
    push rax
    push str_2
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 24
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
    add rax, 16
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    ;; -- cast(ptr) --
    ;; -- cast(ptr) --
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 13
    push rax
    push str_3
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- if --
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
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
    jz addr_511
    ;; -- push str --
    mov rax, 11
    push rax
    push str_4
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    mov rax, [ret_stack_rsp]
    add rax, 8
    push rax
    ;; -- load64 --
    pop rax
    xor rbx, rbx
    mov rbx, [rax]
    push rbx
    mov rax, [ret_stack_rsp]
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
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 1
    push rax
    push str_5
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call eputs
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- end --
addr_511:
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call exit
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    add rsp, 32
    ret
    ;; -- func --
global main
main:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- if --
    ;; -- argc --
    mov rax, [args_ptr]
    mov rax, [rax]
    push rax
    ;; -- push int 2 --
    mov rax, 2
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
    jz addr_528
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
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
    call cstrToStr
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 14
    push rax
    push str_6
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call usage
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- end --
addr_528:
    ;; -- if --
    ;; -- push int 1 --
    mov rax, 1
    push rax
    ;; -- push int 8 --
    mov rax, 8
    push rax
    ;; -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
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
    ;; -- push str --
    mov rax, 5
    push rax
    push str_7
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call strSuffix
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- inv --
    mov rcx, 0
    mov rdx, 1
    pop rax
    cmp rax, rcx
    cmove rcx, rdx
    push rcx
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_551
    ;; -- push int 2 --
    mov rax, 2
    push rax
    ;; -- argv --
    mov rax, [args_ptr]
    add rax, 8
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
    call cstrToStr
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push str --
    mov rax, 45
    push rax
    push str_8
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call usage
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- end --
addr_551:
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
str_2: db 0x55,0x53,0x41,0x47,0x45,0x3a,0x20
str_3: db 0x20,0x3c,0x66,0x69,0x6c,0x65,0x2e,0x74,0x68,0x72,0x74,0x3e,0xa
str_4: db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20,0x3d,0x3e,0x20
str_5: db 0xa
str_6: db 0x4e,0x6f,0x20,0x69,0x6e,0x70,0x75,0x74,0x20,0x66,0x69,0x6c,0x65,0x73
str_7: db 0x2e,0x74,0x68,0x72,0x74
str_8: db 0x53,0x6f,0x75,0x72,0x63,0x65,0x20,0x73,0x69,0x6c,0x65,0x20,0x73,0x68,0x6f,0x75,0x6c,0x64,0x20,0x68,0x61,0x76,0x65,0x20,0x74,0x68,0x65,0x20,0x65,0x78,0x74,0x65,0x6e,0x73,0x69,0x6f,0x6e,0x20,0x60,0x2e,0x74,0x68,0x72,0x74,0x60
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
