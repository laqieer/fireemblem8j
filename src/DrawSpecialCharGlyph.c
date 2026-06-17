#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

u16 *GetColorLut(int color);

void DrawSpecialCharGlyph(int a, int b, struct Glyph *glyph)
{
    int i;
    u32 *r8 = (u32 *)(gActiveFont->vramDest + a * 64);
    u32 *r7 = glyph->bitmap;
    u16 *r2 = GetColorLut(b);

    for (i = 0; i < 16; i++)
    {
        u32 r0 = *r7++;
#ifndef NONMATCHING
        register u32 r4 asm("r4") = r2[r0 & 0xFF];
        register u32 r5 asm("r5") = r2[(r0 >> 8) & 0xFF];
        register u32 var asm("r0") = (r5 << 16);
#else
        u32 r4 = r2[r0 & 0xFF];
        u32 r5 = r2[(r0 >> 8) & 0xFF];
        u32 var = (r5 << 16);
#endif
        u32 var2 = var + r4;

        *r8++ = var2;
    }
}
