#include <stdarg.h>
#include <stdio.h>

#include "global.h"
#include "fontgrp.h"

void PrintDebugStringFmtToBG(u16 *dest, const char *fmt, ...)
{
    va_list args;
    char buffer[256];

    va_start(args, fmt);
    vsprintf(buffer, fmt, args);
    va_end(args);

    PrintDebugStringToBG(dest, buffer);
}
