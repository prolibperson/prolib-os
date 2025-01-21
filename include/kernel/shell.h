#ifndef SHELL_H
#define SHELL_H

#include <stddef.h>

typedef void (*command_function_t)(void);

typedef struct {
    const char* name;
    const char* description;
    command_function_t function;
} shell_command_t;

void shell_run(void);
void shell_help(void);
void shell_echo(void);

#endif
