; argtest -- Test if an argument is present                                   ;
; Usage: argtest <arg to test for> <args to search through>                   ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

format ELF64 executable 3

segment readable executable

include "inc/strcmp.inc"

entry _start
_start:         pop rax            ; get argc
                pop rdi            ; discard program path

                dec rax            ; subtract program path from rax

                mov rdi, 1
                cmp rax, 2         ; exit if args < 2 (excluding path)
                jl exit

                pop rsi            ; search arg
                dec rax

check_loop:     pop rdi            ; next arg
                push rax           ; Save argc to stack
                call strcmp
                mov rdi, rax       ; Copy return value to RDI

                cmp rax, 0         ; exit with code 0 on match
                je exit

                pop rax            ; Get argc back from stack
                dec rax            ; continue loop if arguments left (rax>0)
                cmp rax, 0
                jg check_loop

                mov rdi, 1         ; Ensure exit code is 1 on failure

exit:           mov rax, 60
                syscall
