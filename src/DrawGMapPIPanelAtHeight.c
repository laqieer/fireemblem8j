#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "face.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"

struct Unknown8A3E448 {
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
    /* 02 */ s8 unk_02;
    /* 03 */ s8 unk_03;
};

extern struct Unknown8A3E448 gWorldmapPlayerInterface_0[];

extern u16 gUnk_24[];
extern u16 gUnk_17[];
extern u16 gUnk_25[];
extern u16 gUnk_20[];

//! FE8U = 0x080BE65C
void DrawGMapPIPanelAtHeight(int index, int height, int kind)
{
    int width;
    int height2;

    int a = gWorldmapPlayerInterface_0[index].unk_02;
    int b = gWorldmapPlayerInterface_0[index].unk_03;

    switch (kind)
    {
        case 0:
            width = 12;
            height2 = 4;
            break;

        case 1:
            width = 12;
            height2 = 9;
            break;
    }

    if ((a < 0) && (b < 0))
    {
        int diff;
        TileMap_FillRect(gBG1TilemapBuffer, width, height2, 0);
        TileMap_FillRect(gBG0TilemapBuffer, width, height2, 0);

        diff = height - 10;
        TileMap_CopyRect(gUnk_24 + (height2 - diff) * 0x20, gBG1TilemapBuffer, width, height);
        TileMap_CopyRect(gUnk_17 + (height2 - diff) * 0x20, gBG0TilemapBuffer, width, height);
    }

    if ((a > 0) && (b < 0))
    {
        int diff;
        TileMap_FillRect(gBG1TilemapBuffer + (0x1e - width), width, height2, 0);
        TileMap_FillRect(gBG0TilemapBuffer + (0x1e - width), width, height2, 0);

        diff = height - 10;
        TileMap_CopyRect(
            gUnk_24 + (height2 - diff) * 0x20, gBG1TilemapBuffer + (0x1e - width), width, height);
        TileMap_CopyRect(
            gUnk_17 + (height2 - diff) * 0x20, gBG0TilemapBuffer + (0x1e - width), width, height);
    }

    if ((a < 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x200, 12, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x200, 12, 4, 0);

        TileMap_CopyRect(gUnk_25, gBG1TilemapBuffer + 0x200 + (0x16 - height) * 0x20 - 0x200, 12, height);
        TileMap_CopyRect(gUnk_20, gBG0TilemapBuffer + 0x200 + (0x16 - height) * 0x20 - 0x200, 12, height);
    }

    if ((a > 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x212, 12, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x212, 12, 4, 0);

        TileMap_CopyRect(gUnk_25, gBG1TilemapBuffer + 0x212 + (0x16 - height) * 0x20 - 0x200, 12, height);
        TileMap_CopyRect(gUnk_20, gBG0TilemapBuffer + 0x212 + (0x16 - height) * 0x20 - 0x200, 12, height);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}
