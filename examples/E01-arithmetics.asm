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
;   -- push 12 --
    mov rax, 12
    push rax
;   -- push 13 --
    mov rax, 13
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- push 13 --
    mov rax, 13
    push rax
;   -- push 12 --
    mov rax, 12
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- dump --
    pop rdi
    call dump
;   -- push 2 --
    mov rax, 2
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- push 10 --
    mov rax, 10
    push rax
;   -- push 5 --
    mov rax, 5
    push rax
;   -- division --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- push 11 --
    mov rax, 11
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
;   -- dump --
    pop rdi
    call dump
;   -- push 3 --
    mov rax, 3
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- rotate --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
;   -- dump --
    pop rdi
    call dump
;   -- dump --
    pop rdi
    call dump
;   -- dump --
    pop rdi
    call dump
;   -- push 1 --
    mov rax, 1
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- dump --
    pop rdi
    call dump
;   -- dump --
    pop rdi
    call dump
;   -- push 1 --
    mov rax, 1
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- dump --
    pop rdi
    call dump
;   -- dump --
    pop rdi
    call dump
;   -- dump --
    pop rdi
    call dump
;   -- push 0 --
    mov rax, 0
    push rax
;   -- push 60 --
    mov rax, 60
    push rax
;   -- call --
    pop rax
    pop rdi
    syscall
    push rax
;   -- trash --
    pop rax

    mov rdi, 1
    mov rax, 60
    syscall
section .data
section .bss
rmem: resb 1000000
argv: resq 1
