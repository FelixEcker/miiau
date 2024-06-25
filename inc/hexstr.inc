; hexstr.inc -- Convert bytes into a hexadecimal representation                ;
; Source Addr. in RDI, Byte Count in RSI, Destination Addr. in RDX             ;
;------------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                             ;
; Licensed under the ISC License                                               ;
;------------------------------------------------------------------------------;

irpv any, hexstr_inc { rept 0 {} rept 1 { hexstr_inc equ

segment readable executable
hexstr:         push rax                ; Save registers
                push rsi
                push r10                ; r10 is used as the "next nibble flag"

hexstr_loop:    cmp rsi, 0              ; Check if the byte count has reached 0
                jz hexstr_ret           ; Return on byte count 0

                mov r10, 0              ; Set r10 to 0 (set next nibble flag)
                mov al, [rdi]           ; Get next byte
                mov ah, al              ; Copy the byte to al
                shr al, 4               ; Get next nibble in al for looping

                and al, 0xf             ; Isolate the low nibble
                and ah, 0xf

hexstr_nextnibble:
                cmp al, 0xa             ; If the nibble is less than 10
                jl hexstr_append        ; we can continue on normally

                add al, 7               ; Add 7 to the nibble if its greater
                                        ; so that we end up with the correct
                                        ; ASCII value for it when adding on the
                                        ; regular offset

hexstr_append:  add al, 0x30            ; Make the current nibble an ascii char
                mov [rdx], al           ; Copy it to the output
                inc rdx                 ; Increment output address

                                        ; The next part's a bit funky:
                sub rsi, r10            ; If the nibble flag is 1 (so no next-
                                        ; nibble), the byte count gets 1 smaller
                add rdi, r10            ; and the input address 1 bigger, so we
                                        ; basically move on to the next byte in
                                        ; the input.

                cmp r10, 1              ; Continue on with a new byte on no
                                        ; next nibble
                je hexstr_loop

                mov r10, 1              ; We are going to do the next nibble, so
                                        ; we disable next nibble for the next
                                        ; time we reach hexstr_append
                mov al, ah              ; Move the next nibble into al
                jmp hexstr_nextnibble   ; do the next nibble

hexstr_ret:     pop r10                 ; Restore registers & return.
                pop rsi
                pop rax
                ret

} ; END INCLUDE GUARD
