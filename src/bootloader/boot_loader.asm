[org 0x7c00] ; set origin

;we love BIOS
times 510 - ($-$$) db 0
dw 0xaa55
