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
struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};
extern struct Struct02026E30 gFontgrp_0;

void PrintDebugStringToBG(u16 *dest, const char *str)
{
    int i;

    while (*str != 0)
    {
        int tileIndex;
#ifndef NONMATCHING
        register u32 r6 asm("r6");
#else
        u32 r6;
#endif

        if (*str > 0x60)
            tileIndex = gFontgrp_0.tileIndex + (u16)-0x40;
        else
            tileIndex = gFontgrp_0.tileIndex - 0x20;

        r6 = *str;
        tileIndex += r6;
        *dest++ = tileIndex;
        str++;
    }

    BG_EnableSync(gFontgrp_0.bg);
}
