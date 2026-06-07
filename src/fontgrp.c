#include <stdarg.h>
#include <stdio.h>

#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

#define CHAR_NEWLINE 0x01

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

EWRAM_DATA struct Struct02026E30 gFontgrp_0 = {0};

#include "graphics/debug_font.4bpp.h"

void SetupDebugFontForBG(int bg, int tileDataOffset)
{
    if (tileDataOffset == 0)
        tileDataOffset = 0x5800;

    SetBackgroundTileDataOffset(bg, 0);
    SetBackgroundScreenSize(bg, 0);
    RegisterDataMove(debug_font_4bpp, (void *)(VRAM + (tileDataOffset & 0x1FFFF)), 0x800);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    gPaletteBuffer[2] = RGB(31, 31, 31);
    EnablePaletteSync();

    BG_Fill(BG_GetMapBuffer(bg), 0);

    gFontgrp_0.bg = bg;
    gFontgrp_0.tileDataOffset = tileDataOffset;
    gFontgrp_0.tileIndex = GetTileIndex(bg, tileDataOffset);
}
