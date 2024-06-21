; argtest -- Test if an argument is present                                   ;
; Usage: argtest <arg to test for> <args to search through>                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

BITS 64

global _start

_start:         pop rax            ; get argc
                pop rdi            ; discard program path

                dec rax            ; subtract program path from rax

                mov rdi, 1
                cmp rax, byte 2    ; exit if args < 2 (excluding path)
                jl exit

                pop rsi            ; search arg
                dec rax            ; subtract program path from rax

check_loop:     pop rdi            ; next arg
                call strcmp

                cmp rdi, byte 0    ; exit with code 0 on match
                je exit

                dec rax            ; continue loop if arguments left (rax>0)
                jnz check_loop

                mov rdi, 1         ; Ensure exit code is 1 on failure

exit:           mov rax, 60
                syscall

;------------------------------------------------------------------------------;
; compares two c-style string against each other                               ;
; expects string 1 in rsi and string 2 in rdi                                  ;
; NOTE: The pointer to string2 will be overwritten by the return value         ;
;------------------------------------------------------------------------------;
strcmp:         push rax        ; save rax and string 1 pointer
                push rsi
                xor rax, rax    ; clear rax

_strcmp_next:   mov al, [rdi]   ; get two bytes from string 1 & 2
                mov ah, [rsi]

                cmp al, ah
                jne _strcmp_fail

                cmp al, byte 0  ; NULL Terminator found, compare success
                je _strcmp_done

                inc rsi         ; Next Char, loop again
                inc rdi
                jmp _strcmp_next

_strcmp_done:   mov rdi, 0      ; return value 0, exit
                jmp _strcmp_exit

_strcmp_fail:   mov rdi, 1      ; return value 1, fall through to exit

_strcmp_exit:   pop rsi
                pop rax
                ret
