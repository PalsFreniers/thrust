[bits 64] 
section .text 
;    -- dump fucntion -- 
dump: 
    sub rsp, 40 
    mov ecx, 1 
    mov r8d, 10 
    mov BYTE [rsp+31], 10 
    mov rsi, rsp 
    lea r10, [rsp+31] 
.L2: 
    mov rax, rdi 
    xor edx, edx 
    mov r9, r10 
    div r8 
    sub r9, rcx 
    inc rcx 
    add edx, 48 
    mov BYTE [r9], dl 
    mov rdx, rdi 
    mov rdi, rax 
    cmp rdx, 9 
    ja  .L2 
    sub rsi, rcx 
    mov rdx, rcx 
    mov edi, 1 
    add rsi, 32 
    mov rax, 1 
    syscall 
    add rsp, 40 
    ret 
 
global _start 
_start: 
    mov [argv], rsp
;   -- push 11 --
    mov rax, 11
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- push 40 --
    mov rax, 40
    push rax
;   -- mul --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- dump --
    pop rdi
    call dump

    mov rdi, 0
    mov rax, 60
    syscall

section .bss
    rmem resb 1048576
    argv resq 1
