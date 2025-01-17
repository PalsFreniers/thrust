extern malloc
extern free

global thrust_malloc
thrust_malloc:
        ;; -- stack prep --
        mov [ret_stack_rsp], rsp
        mov rsp, rax
        ;; -- call malloc --
        pop rdi
        call malloc
        push rax
        ;; -- return --
        mov rax, rsp
        mov rsp, [ret_stack_rsp]
        ret

global thrust_free
thrust_free:
        ;; -- stack prep --
        mov [ret_stack_rsp], rsp
        mov rsp, rax
        ;; -- call free --
        pop rdi
        call free
        ;; -- return --
        mov rax, rsp
        mov rsp, [ret_stack_rsp]
        ret

segment .bss
extern args_ptr
extern ret_stack_rsp
extern ret_stack
extern ret_stack_end

