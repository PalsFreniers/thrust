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
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go1:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 30 --
    mov rax, 30
    push rax
;   -- less --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
;   -- go --
    pop rax
    test rax, rax
    jz .go10
;   -- dup --
    pop rax
    push rax
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end --
    jmp .go1
.go10:
;   -- trash --
    pop rax
;   -- push 30 --
    mov rax, 30
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go14:
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- greater --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
;   -- go --
    pop rax
    test rax, rax
    jz .go23
;   -- dup --
    pop rax
    push rax
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end --
    jmp .go14
.go23:
;   -- trash --
    pop rax
;   -- trash --
    pop rax
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
