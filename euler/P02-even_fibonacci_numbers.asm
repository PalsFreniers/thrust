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
;   -- mem --
    push rmem
;   -- push 0 --
    mov rax, 0
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- push 1 --
    mov rax, 1
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- during --
.go5:
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 4000000 --
    mov rax, 4000000
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
    jz .go27
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 2 --
    mov rax, 2
    push rax
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
;   -- push 0 --
    mov rax, 0
    push rax
;   -- equal --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
;   -- if --
    pop rax
    test rax, rax
    jz .if23
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- mem --
    push rmem
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- end if else --
.if23:
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go5
.go27:
;   -- trash --
    pop rax
;   -- trash --
    pop rax
;   -- mem --
    push rmem
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
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
