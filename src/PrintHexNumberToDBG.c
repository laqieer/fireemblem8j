#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

extern struct Font gDefaultFont;
void PutNumberExt(u16 *tm, int color, int number, int id_zero);
void ClearSmallStringBuffer(void);
void StoreNumberStringToSmallBuffer(int n);
void StoreNumberHexStringToSmallBuffer(int n);
void PrintDebugStringAsOBJ(int a, int b, const char *str);
int GetSpecialCharChr(int color, int id);

//! FE8U = 0x08003900
void PrintHexNumberToDBG(int n, int length)
{
    StoreNumberHexStringToSmallBuffer(n);
    PrintStringToDBG(gNumberStr + 8 - length);
}
