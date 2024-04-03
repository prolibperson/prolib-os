C_SOURCES = $(wildcard src/kernel/*.c src/drivers/*.c src/cpu/*.c src/libc/*.c)
HEADERS = $(wildcard src/kernel/*.h src/drivers/*.h src/cpu/*.h src/libc/*.h)

OBJ = $(C_SOURCES:.c=.o) src/cpu/interrupt.o

CC = /usr/local/i386elfgcc/bin/i386-elf-gcc
GDB = /usr/local/i386elfgcc/bin/i386-elf-gdb

CFLAGS = -g -gdwarf-4 -ffreestanding -Wall -Wextra -fno-exceptions -m32

prolib-os.bin: src/bootloader/boot_loader.bin kernel.bin
	cat $^ > build/prolib-os.bin

kernel.bin: src/bootloader/kernel_entry.o ${OBJ}
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.elf: src/bootloader/kernel_entry.o ${OBJ}
	i386-elf-ld -o $@ -Ttext 0x1000 $^ 

run: prolib-os.bin
	qemu-system-i386 -fda build/prolib-os.bin

debug: os-image.bin kernel.elf
	qemu-system-i386 -s -fda os-image.bin -d guest_errors,int &
	${GDB} -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf build/*.bin *.dis *.o os-image.bin *.elf
	rm -rf src/kernel/*.o src/bootloader/*.bin src/drivers/*.o src/bootloader/*.o src/cpu/*.o src/libc/*.o

