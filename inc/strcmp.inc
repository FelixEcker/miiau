; strcmp.inc -- Compare two NULL-Terminated Strings                           ;
; String 1 Addr. in RSI, String 2 Addr. in RDI                                ;
; Return in RAX, 0 on equal                                                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

section .text
strcmp:         push rsi
                push rdi

_strcmp_next:   mov al, [rdi]
                mov ah, [rsi]

                cmp al, ah
                jne _strcmp_ne

                cmp al, byte 0
                je _strcmp_eq
                
                inc rsi
                inc rdi
                jmp _strcmp_next

_strcmp_ne:     mov rax, 1
                jmp _strcmp_ret

_strcmp_eq:     mov rax, 0

_strcmp_ret:    pop rdi
                pop rsi
                ret
