section .text
; Counts the length of the NULL-Terminated string in bytes, clear RAX.
; The Address of the string is expected to be located in RDI
strlen:         xor rax, rax
_strlen_loop:   cmp [rdi + rax], byte 0
                jz _strlen_exit
                inc rax
                jmp _strlen_loop
_strlen_exit:   ret
