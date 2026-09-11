BITS 64
segment .text
%line 0+0 <internal>
global print
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
.L2:
    mov     rax, rdi
    lea     r8, [rsp+32]
    mul     r9
    mov     rax, rdi
    sub     r8, rcx
    shr     rdx, 3
    lea     rsi, [rdx+rdx*4]
    add     rsi, rsi
    sub     rax, rsi
    add     eax, 48
    mov     BYTE [rcx], al
    mov     rax, rdi
    mov     rdi, rdx
    mov     rdx, rcx
    sub     rcx, 1
    cmp     rax, 9
    ja      .L2
    lea     rax, [rsp+32]
    mov     edi, 1
    sub     rdx, rax
    xor     eax, eax
    lea     rsi, [rsp+32+rdx]
    mov     rdx, r8
    mov     rax, 1
    syscall
    add     rsp, 40
    ret
global _start
_start:
    mov [args_ptr], rsp
    mov rax, ret_stack_end
    mov [ret_stack_rsp], rax
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    call main
    mov [ret_stack_rsp], rsp
    mov rsp, rax
    pop qword rdi
    mov rax, 60
    syscall
%line 5+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- func --
global read
read:
%line 5+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 4+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- push int 0 --
    mov rax, 0
    push rax
%line 4+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
%line 5+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
%line 8+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- func --
global write
write:
%line 8+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 7+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- push int 1 --
    mov rax, 1
    push rax
%line 7+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
%line 8+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
%line 11+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- func --
global open
open:
%line 11+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 10+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- push int 2 --
    mov rax, 2
    push rax
%line 10+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
%line 11+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
%line 14+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- func --
global close
close:
%line 14+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 13+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- push int 3 --
    mov rax, 3
    push rax
%line 13+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
%line 14+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
%line 17+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- func --
global exit
exit:
%line 17+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 16+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- push int 60 --
    mov rax, 60
    push rax
%line 16+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- syscall1 --
    pop rax
    pop rdi
    syscall
    push rax
%line 17+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- drop --
    pop rax
%line 17+0 /home/tdelage/Documents/code/python/thrust/selfhost/lib/sys/calls.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
%line 3+0 /home/tdelage/Documents/code/python/thrust/selfhost/main.thrt
    ;; -- func --
global main
main:
%line 3+0 /home/tdelage/Documents/code/python/thrust/selfhost/main.thrt
    ;; -- stack prep --
    mov [ret_stack_rsp], rsp
    mov rsp, rax
%line 4+0 /home/tdelage/Documents/code/python/thrust/selfhost/main.thrt
    ;; -- push int 0 --
    mov rax, 0
    push rax
%line 5+0 /home/tdelage/Documents/code/python/thrust/selfhost/main.thrt
    ;; -- return --
    mov rax, rsp
    mov rsp, [ret_stack_rsp]
    ret
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
segment .bss
global args_ptr
args_ptr: resq 1
global ret_stack_rsp
ret_stack_rsp: resq 1
global ret_stack
ret_stack: resq 4096
global ret_stack_end
ret_stack_end:
