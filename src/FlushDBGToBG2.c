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

void FlushDBGToBG2(void)
{
    int i;

    BG_Fill(gBG2TilemapBuffer, 0);
    for (i = 0; i < 20; i++)
    {
        u16* r3 = gBG2TilemapBuffer + i * 0x20;

        if (gFontgrp_0.unk14[(i + gFontgrp_0.unk10) & 0xFF][0] != 0)
        {
            int j = 0;

            while (gFontgrp_0.unk14[(i + gFontgrp_0.unk10) & 0xFF][j] != 0)
            {
                u16 r2 = gFontgrp_0.unk14[(i + gFontgrp_0.unk10) & 0xFF][j];

                if (r2 > 0x60)
                    r2 -= 0x40;
                else
                    r2 -= 0x20;
                *r3++ = gFontgrp_0.tileIndex + r2;

                j++;
            }
        }
    }

    BG_EnableSyncByMask(1 << 2);
}
