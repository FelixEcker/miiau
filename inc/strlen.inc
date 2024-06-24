; strlen.inc -- Get Length of NULL-Terminated String                          ;
; String Addr. in RDI                                                         ;
; Return in RAX, Length in Bytes (excluding NULL-Terminator                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

segment readable executable
strlen:         xor rax, rax
_strlen_loop:   cmp [rdi + rax], byte 0
                jz _strlen_exit
                inc rax
                jmp _strlen_loop
_strlen_exit:   ret
