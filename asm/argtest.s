; argtest -- Test if an argument is present                                   ;
; Usage: argtest <arg to test for> <args to search through>                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

BITS 64

%include "strcmp.inc"

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
                mov rdi, rax       ; Copy return value to RDI

                cmp rdi, byte 0    ; exit with code 0 on match
                je exit

                dec rax            ; continue loop if arguments left (rax>0)
                jnz check_loop

                mov rdi, 1         ; Ensure exit code is 1 on failure

exit:           mov rax, 60
                syscall
