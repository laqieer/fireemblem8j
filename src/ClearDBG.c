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

void ClearDBG(void)
{
    int i;

    for (i = 0; i < 256; i++)
        gFontgrp_0.unk14[i & 0xFF][0] = 0;

    gFontgrp_0.unk8 = 0;
    gFontgrp_0.unkC = 0;

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(1 << 2);
}
