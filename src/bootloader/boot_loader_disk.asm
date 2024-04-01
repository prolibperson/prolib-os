; we are going to be loading 'dh' sectors from drive 'dl' into ES:BX
disk_load:
        pusha

        ; we will need to set specific values in all registers so we will overwrite our input params in 'dx'
        ; lets put it in the stack for later
        push dx

        mov ah, 0x02    ; int 0x13 function, 0x02 = 'read'
        mov al, dh      ; al = number of sectors to read
        mov cl, 0x02    ; cl = sector
        ; dont forget bootsector is located in the first sector so 0x02 is the first 'available' sector
        mov ch, 0x00
        mov dh, 0x00

        int 0x13        ; we read
        jc disk_error   ; if error D:

        pop dx
        cmp al, dh
        jne sectors_error
        popa
        ret

disk_error:
        mov bx, DISK_ERROR
        call print
        call print_nl
        mov dh, ah      ; ah = error code, dl = disk drive that dropped the error
        jmp disk_loop

sectors_error:
        mov bx, SECTORS_ERROR
        call print

disk_loop:
        jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: DB "Incorrect number of sectors read", 0
