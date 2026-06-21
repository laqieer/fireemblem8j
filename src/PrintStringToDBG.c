#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

struct Struct02026E30
{
    u32 tileDataOffset;
    s16 bg;
    u16 tileIndex;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    char unk14[256][32];
};

extern struct Struct02026E30 gFontgrp_0;
void PrintDebugString(int a, int b, const char *str);

//! FE8U = 0x0800391C
void PrintStringToDBG(const char *str)
{
    while (*str != 0)
    {
        int c = *str;

        if (gFontgrp_0.unk8 == 0x30)
            c = 0;
        else
            str++;
        if (c == '\n')
            c = 0;

        gFontgrp_0.unk14[gFontgrp_0.unkC & 0xFF][gFontgrp_0.unk8] = c;
        gFontgrp_0.unk8++;
        if (c == 0)
        {
            gFontgrp_0.unk8 = 0;
            gFontgrp_0.unkC++;
        }
    }
    if (gFontgrp_0.unkC > gFontgrp_0.unk10 + 20)
        gFontgrp_0.unk10 = gFontgrp_0.unkC - 20;
}
