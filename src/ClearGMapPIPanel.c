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


//! FE8U = 0x080BE82C
void ClearGMapPIPanel(int index)
{
    int a = gWorldmapPlayerInterface_0[index].unk_02;
    int b = gWorldmapPlayerInterface_0[index].unk_03;

    if ((a < 0) && (b < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer, 12, 9, 0);
        TileMap_FillRect(gBG0TilemapBuffer, 12, 9, 0);
    }

    if ((a > 0) && (b < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x012, 12, 9, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x012, 12, 9, 0);
    }

    if ((a < 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x200, 12, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x200, 12, 4, 0);
    }

    if ((a > 0) && (b > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + 0x212, 12, 4, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x212, 12, 4, 0);
    }
    return;
}
