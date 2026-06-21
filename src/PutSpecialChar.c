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

//! FE8U = 0x08004A14
void PutSpecialChar(u16 * tm, int color, int id)
{
    int chr;

    if (id == TEXT_SPECIAL_NOTHING) {
        tm[0x00] = 0;
        tm[0x20] = 0;

        return;
    }

    chr = GetSpecialCharChr(color, id) * 2 + gActiveFont->tileref;

    tm[0x00] = chr;
    tm[0x20] = chr + 1;
}
