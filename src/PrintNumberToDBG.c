#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003898
void PrintNumberToDBG(int n, int length)
{
    StoreNumberStringToSmallBuffer(n);
    PrintStringToDBG(gNumberStr + 8 - length);
}
