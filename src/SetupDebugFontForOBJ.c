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
extern int gFontgrp_1;
extern int gFontgrp_2;

void SetupDebugFontForOBJ(int a, int objPalNum)
{
    int offset;

    if (a < 0)
        a = 0x3000;
    a &= 0xFFFF;

    gFontgrp_1 = a / 32;
    gFontgrp_2 = (objPalNum & 0xF) << 12;

    RegisterDataMove(debug_font_4bpp, (void *)(VRAM + ((a + 0x10000) & 0x1FFFF)), 0x800);

    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 0] = RGB(0, 0, 0);
    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 1] = RGB(0, 0, 31);
    gPaletteBuffer[OBPAL_OFFSET(objPalNum) + 2] = RGB(31, 31, 31);

    EnablePaletteSync();
}
