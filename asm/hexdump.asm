; 00000000: 0000 0000 0000 0000 0000 0000 00000 00000 | ................
; 00000010: 0000 0000 0000 0000 0000 0000 00000 00000 | ................
; 00000020: 0000                                      | ..

BITS 64

%include "syscalls.inc"
%include "stdio_defs.inc"
%include "errno.inc"

%define READ_BUFFER_SIZE 16
%define OUT_BUFFER_SIZE 256

section .bss
read_buffer:	resb READ_BUFFER_SIZE
out_buffer:	resb OUT_BUFFER_SIZE

section .text
global _start
_start:         pop rax
                pop rdi                 ; discard program path
                dec rax

                cmp rax, 0
                jg open                 ; argc > 0, continue normally

                push rax                ; Save argc (=0) to stack
                push FD_STDIN           ; Set STDIN as the fd to read from
                jmp read                ; Begin reading

open:           pop rdi                 ; Pop next path from stack
                dec rax                 ; Decrement argc
                push rax                ; Save argc to stack
                mov rsi, O_RDONLY       ; Open read only
                mov rax, SYSCALL_OPEN
                syscall

                cmp rax, 0              ; Errcheck
                jl error

                push rax                ; Save file descriptor to the stack

read:           mov rdi, [rsp]            ; Get fd into rdi
                mov rsi, read_buffer      ; Read READ_BUFFER_SIZE bytes
                mov rdx, READ_BUFFER_SIZE
                mov rax, SYSCALL_READ
                syscall

                cmp rax, 0            ; Errcheck
                jl error
                je _read_done         ; EOF reached

format:		

                mov rdi, FD_STDOUT    ; Write readbuffer to stdout
                mov rsi, read_buffer
                mov rdx, rax
                mov rax, SYSCALL_WRITE
                syscall

                cmp rax, 0    ; Errcheck
                jl error

                jmp read      ; Read more bytes

_read_done:     pop rax       ; Discard old fd
                pop rax       ; Get argc
                cmp rax, 0
                jg open

                mov rdi, 0    ; Ensure normal exit
                jmp exit      ; Exit

error:          neg rax
                call errno_print
                mov rdi, 0
                mov rsi, 0

exit:           mov rax, SYSCALL_EXIT
                syscall