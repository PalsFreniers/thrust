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
;   -- push 3 --
    mov rax, 3
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
;   -- cast to bool --
;   -- if --
    pop rax
    test rax, rax
    jz .if10
;   -- string litteral --
    push 9
    push str0
;   -- push 1 --
    mov rax, 1
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- call --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
;   -- trash --
    pop rax
;   -- else --
    jmp .if16
.if10:
;   -- string litteral --
    push 8
    push str1
;   -- push 1 --
    mov rax, 1
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- call --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
;   -- trash --
    pop rax
;   -- end if else --
.if16:
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
str0: 
    db 0x33,0x20,0x69,0x73,0x20,0x65,0x76,0x65,0x6e
str1: 
    db 0x33,0x20,0x69,0x73,0x20,0x6f,0x64,0x64
section .bss
rmem: resb 1000000
argv: resq 1
