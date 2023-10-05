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
;   -- push 2 --
    mov rax, 2
    push rax
;   -- during --
.go1:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 20 --
    mov rax, 20
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
    jz .go112
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go7:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 20 --
    mov rax, 20
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
    jz .go25
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
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
.go25:
;   -- trash --
    pop rax
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- during --
.go29:
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 1 --
    mov rax, 1
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
    jz .go62
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
    jz .if58
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
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
;   -- else --
    jmp .if61
.if58:
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end if else --
.if61:
;   -- end during go --
    jmp .go29
.go62:
;   -- trash --
    pop rax
;   -- trash --
    pop rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go66:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 20 --
    mov rax, 20
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
    jz .go108
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- less --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
;   -- if --
    pop rax
    test rax, rax
    jz .if105
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- end if else --
.if105:
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go66
.go108:
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
.go112:
;   -- trash --
    pop rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go126:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 20 --
    mov rax, 20
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
    jz .go171
;   -- mem --
    push rmem
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- push 8 --
    mov rax, 8
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- during --
.go137:
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
    jz .go167
;   -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
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
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- end during go --
    jmp .go137
.go167:
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
    jmp .go126
.go171:
;   -- trash --
    pop rax
;   -- mem --
    push rmem
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- push 20 --
    mov rax, 20
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
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
