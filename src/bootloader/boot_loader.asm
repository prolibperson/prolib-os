[org 0x7c00] ; set offset because of reserved space

; here we are going to print messages to the screen using the print functions we made earlier!
mov bx, MSG_HELLO_WORLD
call print
call print_nl
mov bx, MSG_NEW_LINE
call print

jmp $

%include "src/bootloader/print.asm" ; our nice printing assembly file

; where we define our strings...
MSG_HELLO_WORLD db "Hello World!", 0
MSG_NEW_LINE db "We are on a new line!", 0

;we love BIOS
times 510 - ($-$$) db 0 ; lets fill the rest of the boot sector with zeros! (besides our code)
dw 0xaa55		; magic line that marks our bin as bootable!
