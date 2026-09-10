BITS 64
segment .text
extern thrust_malloc
extern thrust_free
global print
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
.L2:
    mov     rax, rdi
    lea     r8, [rsp+32]
    mul     r9
    mov     rax, rdi
    sub     r8, rcx
    shr     rdx, 3
    lea     rsi, [rdx+rdx*4]
    add     rsi, rsi
    sub     rax, rsi
    add     eax, 48
    mov     BYTE [rcx], al
    mov     rax, rdi
    mov     rdi, rdx
    mov     rdx, rcx
    sub     rcx, 1
    cmp     rax, 9
    ja      .L2
    lea     rax, [rsp+32]
    mov     edi, 1
    sub     rdx, rax
    xor     eax, eax
    lea     rsi, [rsp+32+rdx]
    mov     rdx, r8
    mov     rax, 1
    syscall
    add     rsp, 40
    ret
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
global main
main:
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- push int 15 --
    mov rax, 15
    push rax
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call thrust_malloc
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    ;; -- dup --
    pop rax
    push rax
    push rax
    ;; -- print --
    pop rdi
    call print
    ;; -- call --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call thrust_free
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
segment .bss
global args_ptr
args_ptr: resq 1
global ret_stack_rsp
ret_stack_rsp: resq 1
global ret_stack
ret_stack: resq 4096
global ret_stack_end
ret_stack_end:
