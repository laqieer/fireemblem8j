#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off























//! FE8U = 0x0801FE14
void PutScreenFogEffect(void)
{
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x10)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x10)] = tileRefA;

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x18)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x18)] = tileRefB;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

//! FE8U = 0x0801FEE8
void PutScreenFogEffectOverlayed(void)
{
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x10)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x10)] = tileRefA + 0x400;

            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x18)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x18)] = tileRefB + 0x400;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}
