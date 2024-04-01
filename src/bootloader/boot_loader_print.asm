print:
	pusha

; the main printing loop
start:
	mov al, [bx] 	; bx is the base address of the string
	; here we check for a null byte (string end)
	cmp al, 0 	; comparison
	je done   	; if theres a null byte, we stop the loop and go to 'done'!

	; now we print
	mov ah, 0x0e
	int 0x10  	; bios print interrupt

	; increment then do the next loop
	add bx, 1
	jmp start

done:
	popa
	ret

; now time for printing newlines!
print_nl:
	pusha

	; here we just normally print as usual but this time we print the newline character (0x0a)
	mov ah, 0x0e
	mov al, 0x0a ; newline character
	int 0x10     ; print
	mov al, 0x0d ; carriage return
	int 0x10     ; print again

	popa
	ret
