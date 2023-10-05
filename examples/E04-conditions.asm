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
;   -- push 1 --
    mov rax, 1
    push rax
;   -- cast to bool --
;   -- if --
    pop rax
    test rax, rax
    jz .if5
;   -- push 1 --
    mov rax, 1
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- else --
    jmp .if8
.if5:
;   -- push 0 --
    mov rax, 0
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- end if else --
.if8:
;   -- push 0 --
    mov rax, 0
    push rax
;   -- cast to bool --
;   -- if --
    pop rax
    test rax, rax
    jz .if14
;   -- push 1 --
    mov rax, 1
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- else --
    jmp .if17
.if14:
;   -- push 0 --
    mov rax, 0
    push rax
;   -- dump --
    pop rdi
    call dump
;   -- end if else --
.if17:
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
