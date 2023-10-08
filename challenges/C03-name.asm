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
;   -- string litteral --
    push 20
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
;   -- push 100 --
    mov rax, 100
    push rax
;   -- mem --
    push rmem
;   -- push 0 --
    mov rax, 0
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- call --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
;   -- if --
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- less or equal --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
;   -- go --
    pop rax
    test rax, rax
    jz .go24
;   -- string litteral --
    push 24
    push str1
;   -- push 2 --
    mov rax, 2
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
;   -- push 1 --
    mov rax, 1
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
;   -- end --
.go24:
;   -- string litteral --
    push 7
    push str2
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
;   -- mem --
    push rmem
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
    db 0x57,0x68,0x61,0x74,0x20,0x69,0x73,0x20,0x79,0x6f,0x75,0x72,0x20,0x6e,0x61,0x6d,0x65,0x20,0x3f,0x20
str1: 
    db 0x45,0x72,0x72,0x6f,0x72,0x20,0x64,0x75,0x72,0x69,0x6e,0x67,0x20,0x72,0x65,0x61,0x64,0x69,0x6e,0x20,0x6e,0x61,0x6d,0x65
str2: 
    db 0x48,0x65,0x6c,0x6c,0x6f,0x2c,0x20
section .bss
rmem: resb 1000000
argv: resq 1
