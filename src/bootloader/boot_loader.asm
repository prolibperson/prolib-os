[org 0x7c00] ; set offset because of reserved space

mov bp, 0x9000 ; set stack safely away from us
mov sp, bp

mov bx, MSG_REAL_MODE
call print

; we clear the screen
mov ah, 0x00
mov al, 0x03
int 0x10

call switch_to_pm

jmp $ ; never actually gets executed!

%include "src/bootloader/boot_loader_print.asm" 	; our nice printing assembly file
%include "src/bootloader/boot_loader_disk.asm"  	; our disk functions
%include "src/bootloader/boot_loader_gdt.asm"   	; gdt
%include "src/bootloader/boot_loader_32bprint.asm"	; our 32-bit print functions
%include "src/bootloader/boot_loader_pm.asm"		; our functions for switching to pm!

[bits 32] ; time for protected mode!
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm
	jmp $ ; no kernel yet so we just hang

; where we define our strings...
MSG_REAL_MODE db "Currently in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode!", 0

;we love BIOS
times 510 - ($-$$) db 0 ; lets fill the rest of the boot sector with zeros! (besides our code)
dw 0xaa55		; magic line that marks our bin as bootable!
