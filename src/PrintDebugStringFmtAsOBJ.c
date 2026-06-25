#include <stdarg.h>
#include <stdio.h>

#include "global.h"
#include "fontgrp.h"

void PrintDebugStringAsOBJ(int a, int b, const char *str);

void PrintDebugStringFmtAsOBJ(s16 a, s16 b, const char *fmt, ...)
{
    va_list args;
    char buffer[256];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);

    PrintDebugStringAsOBJ(a, b, buffer);
}
