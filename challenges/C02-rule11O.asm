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
;   -- push 172 --
    mov rax, 172
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
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
    mov byte [rbx], al
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go8:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 172 --
    mov rax, 172
    push rax
;   -- push 2 --
    mov rax, 2
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
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
    jz .go123
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go16:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 172 --
    mov rax, 172
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
    jz .go45
;   -- dup --
    pop rax
    push rax
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
    mov bl, byte [rax]
    push rbx
;   -- cast to bool --
;   -- if --
    pop rax
    test rax, rax
    jz .if34
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 35 --
    mov rax, 35
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- else --
    jmp .if42
.if34:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 32 --
    mov rax, 32
    push rax
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- end if else --
.if42:
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go16
.go45:
;   -- trash --
    pop rax
;   -- push 172 --
    mov rax, 172
    push rax
;   -- dup --
    pop rax
    push rax
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
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
;   -- push 172 --
    mov rax, 172
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
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
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov bl, byte [rax]
    push rbx
;   -- push 1 --
    mov rax, 1
    push rax
;   -- shr --
    pop rcx
    pop rbx
    shl rbx, cl
    push rbx
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
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov bl, byte [rax]
    push rbx
;   -- and --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go78:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 172 --
    mov rax, 172
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
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
    jz .go119
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
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
    mov bl, byte [rax]
    push rbx
;   -- mem --
    push rmem
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov bl, byte [rax]
    push rbx
;   -- push 1 --
    mov rax, 1
    push rax
;   -- shr --
    pop rcx
    pop rbx
    shl rbx, cl
    push rbx
;   -- push 7 --
    mov rax, 7
    push rax
;   -- and --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
;   -- and --
    pop rax
    pop rbx
    or rbx, rax
    push rbx
;   -- mem --
    push rmem
;   -- push 172 --
    mov rax, 172
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
    mov byte [rbx], al
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem --
    push rmem
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 110 --
    mov rax, 110
    push rax
;   -- mem --
    push rmem
;   -- push 172 --
    mov rax, 172
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov bl, byte [rax]
    push rbx
;   -- shr --
    pop rcx
    pop rbx
    shr rbx, cl
    push rbx
;   -- push 1 --
    mov rax, 1
    push rax
;   -- and --
    pop rax
    pop rbx
    and rbx, rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov byte [rbx], al
;   -- push 1 --
    mov rax, 1
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- end during go --
    jmp .go78
.go119:
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
    jmp .go8
.go123:
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
