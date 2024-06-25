segment readable executable
; INPUTS
; rdi: source addr
; rsi: byte count
; rdx: dest addr
hex_str:        push rax                ; Save registers
                push rsi
                push r10                ; r10 is used as the "next nibble flag"

hex_str_loop:   cmp rsi, 0              ; Check if the byte count has reached 0
                jz hex_str_ret          ; Return on byte count 0

                mov r10, 0              ; Set r10 to 0 (set next nibble flag)
                mov al, [rdi]           ; Get next byte
                mov ah, al              ; Copy the byte to al
                shr al, 4               ; Get next nibble in al for looping

                and al, 0xf             ; Isolate the low nibbles
                and ah, 0xf

hex_str_nextnibble:
                cmp al, 0xa             ; If the nibble is less than 10
                jl hex_str_append       ; we can continue on normally

                add al, 7               ; Add 7 to the nibble if its greater
                                        ; so that we end up with the correct
                                        ; ASCII value for it when adding on the
                                        ; regular offset

hex_str_append: add al, 0x30            ; Make the current nibble an ascii char
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
                je hex_str_loop

                mov r10, 1              ; We are going to do the next nibble, so
                                        ; we disable next nibble for the next
                                        ; time we reach hex_str_append
                mov al, ah              ; Move the next nibble into al
                jmp hex_str_nextnibble  ; do the next nibble

hex_str_ret:    pop r10                 ; Restore registers & return.
                pop rsi
                pop rax
                ret
