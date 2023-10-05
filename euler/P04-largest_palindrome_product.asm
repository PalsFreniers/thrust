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
;   -- push 100 --
    mov rax, 100
    push rax
;   -- during --
.go1:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 1000 --
    mov rax, 1000
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
    jz .go57
;   -- push 100 --
    mov rax, 100
    push rax
;   -- during --
.go7:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 1000 --
    mov rax, 1000
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
    jz .go53
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
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go17:
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
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
    jz .go32
;   -- push 10 --
    mov rax, 10
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 10 --
    mov rax, 10
    push rax
;   -- modulo --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
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
;   -- push 10 --
    mov rax, 10
    push rax
;   -- division --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- end during go --
    jmp .go17
.go32:
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- trash --
    pop rax
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
    jz .if48
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem --
    push rmem
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- greater --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
;   -- if --
    pop rax
    test rax, rax
    jz .if47
;   -- mem --
    push rmem
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- end if else --
.if47:
;   -- end if else --
.if48:
;   -- trash --
    pop rax
;   -- trash --
    pop rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go7
.go53:
;   -- trash --
    pop rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go1
.go57:
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
