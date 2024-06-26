; hexdump -- dump the contents of a file in hexadecimal & ascii format         ;
; Usage: hexdump [file...]                                                     ;
;------------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                             ;
; Licensed under the ISC License                                               ;
;------------------------------------------------------------------------------;

format ELF64 executable 3

include "inc/errno.inc"
include "inc/hexstr.inc"
include "inc/syscalls.inc"
include "inc/stdio_defs.inc"

; Uncomment to support displaying extended ASCII codes
; define EXTENDED_ASCII 1

; errors on rax <0
macro syscall_errcheck {
  cmp rax, 0
  jl error
}

READ_BUFFER_SIZE = 16
OUT_BUFFER_SIZE  = 69

OUT_BUFFER_ADDR_START  = 0
OUT_BUFFER_ADDR_COLON  = 8
OUT_BUFFER_DATA_START  = 10
OUT_BUFFER_PIPE_START  = 50
OUT_BUFFER_ASCII_START = 52
OUT_BUFFER_LINEFEED    = 68

segment readable writeable
read_buffer	rb READ_BUFFER_SIZE
out_buffer      rb OUT_BUFFER_SIZE

segment readable executable
entry _start
_start:         pop rax                     ; Get argc
                pop rdi                     ; Discard program path
                dec rax                     ; remove program path from argc

                cmp rax, 0                  ; If argc > 0, try to open files
                jg open_file

                ; Work with STDIN if no files were provided
                push rax                    ; Save argc 0
                push FD_STDIN               ; Use STDIN as file
                jmp read_chunk              ; Start reading

open_file:      pop rdi                     ; Get next path
                dec rax                     ; Decrement argc
                push rax                    ; Save new argc

                mov rsi, O_RDONLY           ; Open file in read only mode
                mov rax, SYSCALL_OPEN
                syscall

                syscall_errcheck

                push rax                    ; Save fd

                mov r8, 0                   ; Chunk counter

read_chunk:     mov rdi, [rsp]              ; get current fd
                mov rsi, read_buffer
                mov rdx, READ_BUFFER_SIZE
                mov rax, SYSCALL_READ
                syscall

                syscall_errcheck
                je read_chunk_done

                call make_outbuf            ; Format read data

                mov rdi, FD_STDOUT          ; Write data to stdout
                mov rsi, out_buffer
                mov rdx, OUT_BUFFER_SIZE
                mov rax, SYSCALL_WRITE
                syscall

                syscall_errcheck

                inc r8                      ; Increment chunk counter
                jmp read_chunk              ; Read again

read_chunk_done:
                pop rax                     ; Discard old fd
                pop rax                     ; Get argc
                cmp rax, 0
                jg open_file                ; Open next file if we have another

                mov rdi, 0                  ; Exit with code 0
                jmp exit

error:          neg rax
                call errno_print
                mov rdi, 1
                mov rsi, 0

exit:           mov rax, SYSCALL_EXIT
                syscall

;------------------------------------------------------------------------------;
; Make the output buffer with the data currently in the input buffer           ;
; Expects the chunk counter to be in r8, will modify r10, rdi, rsi & rdx       ;
;------------------------------------------------------------------------------;

make_outbuf:    call init_outbuf            ; Initialise output buffer
                mov r10, rax                ; Save byte count to r10
                push rax

                mov eax, 16                 ; Calculate chunk address
                mul r8

                rol ax, 8                   ; Reverse the byte order of the
                rol eax, 16                 ; chunk address's lower 32 bit.
                rol ax, 8

                push rax                    ; Save chunk address

                mov rdi, rsp                ; Append chunk address from stack
                mov rsi, 4
                mov rdx, out_buffer + OUT_BUFFER_ADDR_START
                call hexstr

                pop rax                     ; Discard chunk address

                ; ": " after address
                mov [out_buffer + OUT_BUFFER_ADDR_COLON], ':'
                mov [out_buffer + OUT_BUFFER_ADDR_COLON + 1], ' '

                ; Data in hexadecimal form
                mov rdx, OUT_BUFFER_DATA_START  ; We only set each parameter
                add rdx, out_buffer             ; once and modify some of them
                mov rdi, read_buffer            ; to move along in both buffers
                mov rsi, 2
make_outbuf_data_loop:
                call hexstr                     ; convert next 2 bytes

                add rdx, 1                      ; add 1 additional byte to the
                                                ; output offset
                sub r10, 2                      ; decrement the byte counter
                cmp r10, 0                      ; loop if we have data left
                jg make_outbuf_data_loop
; end loop

                ; hex / ascii seperator
                mov [out_buffer + OUT_BUFFER_PIPE_START], '|'

                ; data in ascii form
                pop r10                         ; Get byte count from stack
                mov rdi, read_buffer
                mov rdx, out_buffer + OUT_BUFFER_ASCII_START
make_outbuf_ascii_loop:
                mov sil, [rdi]                  ; Get next byte
                cmp sil, 0x20                   ; Check if non-printable
                jl make_outbuf_non_printable

if defined EXTENDED_ASCII
                cmp sil, 0x7F                   ; Check if DEL
                je make_outbuf_non_printable
else
                cmp sil, 0x7E
                jg make_outbuf_non_printable
end if

                ; Either normal ascii or extended ascii
                jmp make_outbuf_ascii_loop_cont

make_outbuf_non_printable:
                mov sil, '.'

make_outbuf_ascii_loop_cont:
                mov [rdx], sil
                inc rdx
                inc rdi
                dec r10
                cmp r10, 0
                jg make_outbuf_ascii_loop
; end loop

                mov [out_buffer + OUT_BUFFER_LINEFEED], 0x0A

                ret
; end make_outbuf

;------------------------------------------------------------------------------;
; Initialises the output buffer with spaces                                    ;
;------------------------------------------------------------------------------;

init_outbuf:    push rax
                mov rax, OUT_BUFFER_SIZE
init_outbuf_loop:
                mov [out_buffer + rax], 0x20
                dec rax
                cmp rax, 0
                jg init_outbuf_loop

                pop rax
                ret
