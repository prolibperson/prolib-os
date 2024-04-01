[org 0x7c00] ; set origin

;lets try to print something to the screen...
mov ah, 0x0e    ; tty mode ofc
mov al, 'H'     ; first letter!
int 0x10        ; now lets use this interrupt to print it

;same thing for here!
mov ah, 0x0e
mov al, 'i'
int 0x10

mov ah, 0x0e
mov al, '!'
int 0x10

jmp $           ; now we hang!

;we love BIOS
times 510 - ($-$$) db 0 ; lets fill the rest of the boot sector with zeros! (besides our code)
dw 0xaa55
