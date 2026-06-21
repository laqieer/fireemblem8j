#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003814
void ClearSmallStringBuffer(void)
{
    u32 *ptr = (u32 *)gNumberStr;
    const u32 fourSpaces = 0x20202020;

    *ptr++ = fourSpaces;
    *ptr++ = fourSpaces;
    gNumberStr[8] = 0;
}
