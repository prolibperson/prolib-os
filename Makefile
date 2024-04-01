prolib-os.bin: src/bootloader/boot_loader.asm
	nasm -f bin $^ -o build/prolib-os.bin

run:
	qemu-system-x86_64 build/prolib-os.bin
