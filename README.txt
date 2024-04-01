hey

most of this is tutorial code but arranged and organized by me and the shell commands are mostly me

and this is also a learning project of mine 

resources:
	https://github.com/cfenollosa/os-tutorial
	https://wiki.osdev.org/

to build:
	you will need a gcc cross-compiler (i386-elf-gcc) (i used gcc 11.2.0) *FOR NOW YOU DONT NEED THIS*
	you will need these (qemu, nasm, build-essential) for running the os, and building *<--- YOULL JUST NEED THIS*
	for the cross compiler, you will need (libgmp-dev, libmpfr-dev, libmpc-dev, gcc (yes we are using gcc to build gcc))
	
	run "make" to compile and "make run" to run the os using qemu

if you dont feel like building:
	in the "build" directory, there will be a nice bin file containing the os, so all you will need to do is to "make run"
	(or "qemu-system-x86_64 -fda build/prolib-os.bin")
