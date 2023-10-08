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
;   -- argv --
    mov qword rax, [argv]
    add rax, 8
    push rax
;   -- argc --
    mov qword rax, [argv]
    push qword [rax]
;   -- during --
.go2:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
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
    jz .go43
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- cast to ptr --
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- during --
.go13:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov bl, byte [rax]
    push rbx
;   -- push 0 --
    mov rax, 0
    push rax
;   -- less or equal --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
;   -- go --
    pop rax
    test rax, rax
    jz .go25
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- end --
    jmp .go13
.go25:
;   -- trash --
    pop rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
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
;   -- string litteral --
    push 1
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
;   -- push 1 --
    mov rax, 1
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- end --
    jmp .go2
.go43:
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
str0: 
    db 0xa
section .bss
rmem: resb 1000000
argv: resq 1
