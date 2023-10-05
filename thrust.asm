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
;   -- push 34 --
    mov rax, 34
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 16 --
    mov rax, 16
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 8 --
    mov rax, 8
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
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- rotate --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 0 --
    mov rax, 0
    push rax
;   -- push 35 --
    mov rax, 35
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 16 --
    mov rax, 16
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 8 --
    mov rax, 8
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
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- rotate --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 2 --
    mov rax, 2
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 16 --
    mov rax, 16
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 8 --
    mov rax, 8
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
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- rotate --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 26 --
    mov rax, 26
    push rax
;   -- push 0 --
    mov rax, 0
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 16 --
    mov rax, 16
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 8 --
    mov rax, 8
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
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- rotate --
    pop rax
    pop rbx
    pop rcx
    push rbx
    push rax
    push rcx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 0 --
    mov rax, 0
    push rax
;   -- during --
.go189:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
    jz .go539
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 16 --
    mov rax, 16
    push rax
;   -- multiplication --
    pop rax
    pop rbx
    mul rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 1024 --
    mov rax, 1024
    push rax
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
;   -- push 8 --
    mov rax, 8
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
    jz .if281
;   -- dup --
    pop rax
    push rax
    push rax
;   -- push 8 --
    mov rax, 8
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
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- push 1024 --
    mov rax, 1024
    push rax
;   -- greater or equal --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
;   -- if --
    pop rax
    test rax, rax
    jz .if258
;   -- string litteral --
    push 52
    push str0
;   -- string litteral --
    push 8
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
;   -- string litteral --
    push 17
    push str2
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
;   -- string litteral --
    push 4
    push str3
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
;   -- end if else --
.if258:
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- else --
    jmp .if535
.if281:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- push 2 --
    mov rax, 2
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
    jz .if448
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
    jz .if318
;   -- string litteral --
    push 55
    push str4
;   -- string litteral --
    push 8
    push str5
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
;   -- string litteral --
    push 17
    push str6
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
;   -- string litteral --
    push 4
    push str7
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
;   -- end if else --
.if318:
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
    jz .if371
;   -- string litteral --
    push 55
    push str8
;   -- string litteral --
    push 8
    push str9
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
;   -- string litteral --
    push 17
    push str10
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
;   -- string litteral --
    push 4
    push str11
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
;   -- end if else --
.if371:
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- push 1024 --
    mov rax, 1024
    push rax
;   -- greater or equal --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
;   -- if --
    pop rax
    test rax, rax
    jz .if425
;   -- string litteral --
    push 52
    push str12
;   -- string litteral --
    push 8
    push str13
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
;   -- string litteral --
    push 17
    push str14
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
;   -- string litteral --
    push 4
    push str15
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
;   -- end if else --
.if425:
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- else --
    jmp .if534
.if448:
;   -- dup --
    pop rax
    push rax
    push rax
;   -- mem read --
    pop rax
    xor rbx, rbx
    mov rbx, qword [rax]
    push rbx
;   -- push 26 --
    mov rax, 26
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
    jz .if508
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
    jz .if485
;   -- string litteral --
    push 55
    push str16
;   -- string litteral --
    push 8
    push str17
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
;   -- string litteral --
    push 17
    push str18
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
;   -- string litteral --
    push 4
    push str19
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
;   -- end if else --
.if485:
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
;   -- mem write --
    pop rax
    pop rbx
    mov qword [rbx], rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- push 8 --
    mov rax, 8
    push rax
;   -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
;   -- mem --
    push rmem
;   -- push 32 --
    mov rax, 32
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
;   -- dump --
    pop rdi
    call dump
;   -- else --
    jmp .if533
.if508:
;   -- string litteral --
    push 28
    push str20
;   -- string litteral --
    push 8
    push str21
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
;   -- string litteral --
    push 17
    push str22
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
;   -- string litteral --
    push 4
    push str23
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
;   -- end if else --
.if533:
;   -- end if else --
.if534:
;   -- end if else --
.if535:
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
    jmp .go189
.go539:
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
    db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x6f,0x76,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x75,0x73,0x68,0x20,0x74,0x6f,0x20,0x66,0x75,0x6c,0x6c,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str1: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str2: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str3: 
    db 0x20,0x2d,0x3e,0x20
str4: 
    db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x75,0x6e,0x64,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x6f,0x70,0x20,0x66,0x72,0x6f,0x6d,0x20,0x65,0x6d,0x70,0x74,0x79,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str5: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str6: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str7: 
    db 0x20,0x2d,0x3e,0x20
str8: 
    db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x75,0x6e,0x64,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x6f,0x70,0x20,0x66,0x72,0x6f,0x6d,0x20,0x65,0x6d,0x70,0x74,0x79,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str9: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str10: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str11: 
    db 0x20,0x2d,0x3e,0x20
str12: 
    db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x6f,0x76,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x75,0x73,0x68,0x20,0x74,0x6f,0x20,0x66,0x75,0x6c,0x6c,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str13: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str14: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str15: 
    db 0x20,0x2d,0x3e,0x20
str16: 
    db 0x73,0x69,0x6d,0x75,0x6c,0x61,0x74,0x69,0x6f,0x6e,0x20,0x73,0x74,0x61,0x63,0x6b,0x20,0x75,0x6e,0x64,0x65,0x72,0x66,0x6c,0x6f,0x77,0x20,0x63,0x61,0x6e,0x6e,0x6f,0x74,0x20,0x70,0x6f,0x70,0x20,0x66,0x72,0x6f,0x6d,0x20,0x65,0x6d,0x70,0x74,0x79,0x20,0x73,0x74,0x61,0x63,0x6b,0xa
str17: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str18: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str19: 
    db 0x20,0x2d,0x3e,0x20
str20: 
    db 0x75,0x6e,0x6b,0x6e,0x6f,0x77,0x6e,0x20,0x6f,0x70,0x72,0x61,0x74,0x69,0x6f,0x6e,0x20,0x75,0x6e,0x72,0x65,0x61,0x63,0x68,0x61,0x62,0x6c,0x65
str21: 
    db 0x5b,0x45,0x52,0x52,0x4f,0x52,0x5d,0x20
str22: 
    db 0x74,0x68,0x72,0x75,0x73,0x74,0x2e,0x74,0x68,0x72,0x74,0x3a,0x31,0x30,0x33,0x3a,0x39
str23: 
    db 0x20,0x2d,0x3e,0x20
section .bss
rmem: resb 1000000
argv: resq 1
