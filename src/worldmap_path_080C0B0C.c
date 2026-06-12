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

//! FE8U = 0x080BBCC8
void MapRoute_BlitFullWindow(int a, int b, int bg)
{
    u16 * buf;
    u16 * bgBuf;
    u16 terminator;
    u16 unkB;
    u16 unkA;
    u16 i;
    u16 * tm;

    if (b < 19)
    {
        terminator = b + 21;
    }
    else
    {
        terminator = 40;
    }

    unkA = (a & 0x1f);
    unkB = (0x20 - unkA);

    bgBuf = BG_GetMapBuffer(bg);

    buf = gUnk_9 + (b * 60 + a);

    if (unkB >= 0x1f)
    {
        for (i = b; i < terminator; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(unkA, i % 0x20);
            CpuCopy16(buf, tm, 0x3E);
            buf = buf + 60;
        }
    }
    else
    {
        for (i = b; i < terminator; i++)
        {
            tm = bgBuf + TILEMAP_INDEX(0, i & 0x1f);
            CpuCopy16(buf, tm + unkA, unkB * 2);
            CpuCopy16(buf + unkB, tm, (0x1f - unkB) * 2);
            buf = buf + 60;
        }
    }

    return;
}
