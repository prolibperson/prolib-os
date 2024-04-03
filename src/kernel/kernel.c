#include "../cpu/isr.h"
#include "../drivers/screen.h"
#include "kernel.h"
#include "../libc/string.h"
#include "../libc/mem.h"
#include <stdint.h>

void kernel_main() {
    isr_install();
    irq_install();

    asm("int $2");
    asm("int $3");

    kprint("\n\nWelcome to Prolib OS!\n"
        "Type HELP for a list of commands.\n> ");
}

void user_input(char *input) {
    if (strcmp(input, "END") == 0) {
        kprint("Stopping the CPU :D\n");
        asm volatile("hlt");
    }
    else if (strcmp(input, "HELP") == 0) {
	kprint("HELP: Shows a list of commands\nEND: Stops the cpu\nPAGE: Requests a kmalloc()\nECHO: Echos your input\nOSAKA: Run it and find out..");
	}
    else if (strcmp(input, "OSAKA") == 0) {
        kprint("             @@@@@@@@@@@@@@@@@@@ \n");
	kprint("         @@@@@@@@@@@@@@@@@@@@@@@@@@ \n");
	kprint("      @@@@@@@@@@@@@@@@v@@@@@@@@@@@@@@@@ \n");
	kprint("    @@@@@@@@@@@@@@@@@v v@@@@@@@@@@@@@@@@@ \n");
	kprint("   @@@@@@@@@@@v@@@@@v   v@@@@@v@@@@@@@@@@@ \n");
	kprint("  @@@@@@@@@@@v v@@@v     v@@@v v@@@@@@@@@@@ \n");
	kprint(" @@@@@@@@vv@v   v@v       v@v   v@vv@@@@@@@@ \n");
	kprint(" @@@@@@@v _v_____v         v ____v_ v@@@@@@@ \n");
	kprint(" @@@@@@v /  *****\\         /*****  \\ v@@@@@@ \n");
	kprint(" @@@@@@v/  *******         *******  \\v@@@@@@ \n");
	kprint(" @@@@@@ |  *******         *******  | @@@@@@ \n");
	kprint(" @@@@@@ \\  *******         *******  / @@@@@@ \n");
	kprint(" @@@@@@     *****           *****     @@@@@@ \n");
	kprint(" @@@@@@                               @@@@@@ \n");
	kprint(" @@@@@@                               @@@@@@ \n");
	kprint(" @@@@@@@            _____            @@@@@@@ \n");
	kprint(" v@@@@@@@@          \\___/          @@@@@@@@v \n");
	kprint(" v@@@@@@@@@@@@@               @@@@@@@@@@@@@v \n");
	kprint("  v@@@@@@@@@@@@@@@@_______@@@@@@@@@@@@@@@@v \n");
	kprint("  v@@@@@@@@@@@@@@@@|     |@@@@@@@@@@@@@@@@v \n");
	kprint("   v@@@@@@@@@@@@@@_|     |_@@@@@@@@@@@@@@v \n");
	kprint("   v@@@@@@@@@@@@ / \\_____/ \\ @@@@@@@@@@@@v \n");
	kprint("    v@@@@@@@@@@ /    \\ /    \\ @@@@@@@@@@v \n");
	kprint("     v@v v@v v@|      |      |@v v@v v@v \n");
	kprint("      v   v   v|      |      |v   v   v ");
    } else if(strcmp(input, "ECHO") == 0) {
	kprint(input); //this lowkey doesnt work but i have more important things to fix
    }
    else {
	kprint("Unrecognized command..\n");
    }
    kprint("\n> ");
}
