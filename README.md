# prolib-os

toy project for curing boredom

features:

almost fully working shell

working ps/2 keyboard driver

cool looking logging

interrupt support with a fully set up idt and gdt

running:

you need qemu-system-i386

then do make run or make run-release


building: https://wiki.osdev.org/GCC_Cross-Compiler
then do make

plans:

custom bootloader; 

64 bit; 

-fully functional shell with commands and stuff;- DONE

move away from vga text mode and move to vesa bios modes; 

fat32 filesystem; 

and more that ill figure out along the way
