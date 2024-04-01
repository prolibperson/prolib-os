[bits 32] ; using 32-bit protected mode!

; define some constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY

print_string_pm_loop:
	mov al, [ebx]			; [ebx] is where our character is!
	mov ah, WHITE_ON_BLACK

	cmp al, 0			; we check for a null byte..
	je print_string_pm_done		; then if there is one, we're done!

	mov [edx], ax			; we store our character + attribute in video memory
	add ebx, 1			; next char
	add edx, 2			; next video memory position

	jmp print_string_pm_loop

print_string_pm_done:
	popa
	ret
