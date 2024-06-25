; 00000000: 0000 0000 0000 0000 0000 0000 00000 00000 | ................
; 00000010: 0000 0000 0000 0000 0000 0000 00000 00000 | ................
; 00000020: 0000                                      | ..

format ELF64 executable 3

include "inc/syscalls.inc"
include "inc/stdio_defs.inc"
include "inc/hexstr.inc"

READ_BUFFER_SIZE = 16
OUT_BUFFER_SIZE = 256

segment readable writeable
read_buffer	db 0x10, 0x21, 0x32, 0x43, 0x54, 0x65 , 0x76, 0x87, 0x98, 0xa9, 0xb1, 0xc1, 0xd2, 0xe3, 0xf4, 0xff
out_buffer      rb OUT_BUFFER_SIZE

segment readable executable
entry _start
_start:         mov rdi, read_buffer
                mov rsi, READ_BUFFER_SIZE
                mov rdx, out_buffer
                call hexstr

                mov rdi, FD_STDOUT
                mov rsi, out_buffer
                mov rdx, 32
                mov rax, SYSCALL_WRITE
                syscall

__break:        mov rdi, 0

exit:           mov rax, SYSCALL_EXIT
                syscall
