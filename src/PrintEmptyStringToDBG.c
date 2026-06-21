#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003800
void PrintEmptyStringToDBG(const char *fmt, ...)
{
    char buffer[256];

    // print an empty buffer? uh... okay.
    PrintStringToDBG(buffer);
}
