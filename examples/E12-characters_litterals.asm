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
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 72 --
    mov rax, 72
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- mem --
    push rmem
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 101 --
    mov rax, 101
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- mem --
    push rmem
;   -- push 2 --
    mov rax, 2
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 121 --
    mov rax, 121
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- mem --
    push rmem
;   -- push 3 --
    mov rax, 3
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 33 --
    mov rax, 33
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- mem --
    push rmem
;   -- push 4 --
    mov rax, 4
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 10 --
    mov rax, 10
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- push 5 --
    mov rax, 5
    push rax
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

    mov rdi, 1
    mov rax, 60
    syscall
section .data
section .bss
rmem: resb 1000000
argv: resq 1
