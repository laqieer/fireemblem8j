#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"

#include "constants/chapters.h"
#include "constants/worldmap.h"

#include "worldmap.h"
#include "constants/songs.h"

// clang-format off









































extern u8 gWorldmapSprite_2[];
extern u8 gWorldmapSprite_3[];
extern u8 gWorldmapSprite_4[];
extern u8 gWorldmapSprite_5[];
extern u8 gWorldmapSprite_6[];
extern u8 gWorldmapSprite_7[];
extern u8 gWorldmapSprite_8[];
extern u8 gWorldmapSprite_9[];
extern u8 gWorldmapSprite_10[];
extern u8 gWorldmapSprite_11[];
extern u8 gWorldmapSprite_12[];
extern u8 gWorldmapSprite_13[];
extern u8 gWorldmapSprite_14[];
extern u8 gWorldmapSprite_15[];
extern u8 gWorldmapSprite_16[];
extern u8 gWorldmapSprite_17[];
extern u8 gWorldmapSprite_18[];
extern u8 gWorldmapSprite_19[];
extern u8 gWorldmapSprite_20[];
extern u8 gWorldmapSprite_21[];
extern u8 gWorldmapSprite_22[];
extern u8 gWorldmapSprite_23[];
extern u8 gWorldmapSprite_24[];
extern u8 gWorldmapSprite_25[];
extern u8 gWorldmapSprite_26[];
extern u8 gWorldmapSprite_27[];
extern u8 gWorldmapSprite_28[];
extern u8 gWorldmapSprite_29[];
extern u8 gWorldmapSprite_30[];
extern u8 gWorldmapSprite_31[];
extern u8 gWorldmapSprite_32[];
extern u8 gWorldmapSprite_33[];

extern const struct GMapPathData gWMPathData[];

extern u16 gUnk_9[];

/* file-scope type definitions used by this run */


struct UnknownWorldMapStructA
{
    /* 00 */ STRUCT_PAD(0x00, 0x34);
    /* 34 */ struct UnknownWorldMapStructB * unk_34[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x60);
    /* 60 */ u8 unk_60;
};

//! FE8U = 0x080BBDA4
void MapRoute_BlitScrollEdge(int a1, int r8, int r4, int r9, int sp20)
{
    u16 i;
    u16 r1, r2;
    u32 r3;
    u16 *tm;
    u16 *puVar6;
    u16 r6;
    u32 r7;
    u16 *bgBuf;

    bgBuf = BG_GetMapBuffer(sp20);
    if (a1 != r4)
    {
        if (a1 > r4)
        {
            r1 = a1 + 0x1e;
            r2 = r8;
        }
        else
        {
            r1 =  a1;
            r2 = r8;
        }
        r7 = r1 & 0x1f;
    
        puVar6 = gUnk_9 + (r2 * 0x3c + r1);
        for (i = 0; i < 0x15; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(r7, (r2 + i) & 0x1f);
            *tm = *puVar6;
            puVar6 += 0x3c;
        }
    }

    if (r8 != r9)
    {
        if (r8 > r9)
        {
            r1 = a1;
            r2 = r8 + 0x14;
        }
        else
        {
            r1 = a1;
            r2 = r8;
        }
        r7 = r1 & 0x1f;
        r3 = r2 & 0x1f;

        puVar6 = gUnk_9 + (r2 * 0x3c + r1);
        r6 = 0x20 - r7;
        if (r6 > 0x1e)
        {
            tm = bgBuf + TILEMAP_INDEX(r7, r3);
            CpuCopy16(puVar6, tm, 0x3e);
        }
        else
        {
            tm = bgBuf + TILEMAP_INDEX(0, r3);
            CpuCopy16(puVar6, tm + r7, r6 * 2);
            CpuCopy16(puVar6 + r6, tm, (0x1f - r6) * 2);
        }
    }

    return;
}
