; strcmp.inc -- Compare two NULL-Terminated Strings                           ;
; String 1 Addr. in RSI, String 2 Addr. in RDI                                ;
; Return in RAX, 0 on equal                                                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

irpv any, strcmp_inc { rept 0 {} rept 1 { strcmp_inc equ

segment readable executable
strcmp:         push rsi
                push rdi

_strcmp_next:   mov al, [rdi]
                mov ah, [rsi]

                sub al, ah
                jnz _strcmp_ret

                cmp al, byte 0
                je _strcmp_ret

                inc rsi
                inc rdi
                jmp _strcmp_next

_strcmp_ret:    pop rdi
                pop rsi
                ret

} ; END INCLUDE GUARD
