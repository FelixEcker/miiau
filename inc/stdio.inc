%include "syscalls.inc"

__make_errno:   sub rax, 0
                ret 

open:           push rax  ; Save RAX
                mov rax, SYSCALL_OPEN
                syscall

                cmp rax, 0
                jl __rax_make_errno
                ret
