#include "global.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "helpbox.h"
#include "worldmap.h"
#include "constants/songs.h"


struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};
extern u16  gBgConfig_WorldmapStatus[];

void WorldmapStatus_InitGfx(void)
{
    SetupBackgrounds(gBgConfig_WorldmapStatus);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ReadGameSaveCoreGfx();
    ApplyUnitSpritePalettes();
    StartMuralBackground(NULL, (void *)0x0600B000, -1);

    Decompress(gWorldmapMinimap_0, (void *)0x06003000);
    ApplyPalettes(gWorldmapMinimap_7, 6, 3);

    EnablePaletteSync();

    Decompress(gWorldmapMinimap_1, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 14), gWorldmapMinimap_2, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 3), gWorldmapMinimap_3, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), gWorldmapMinimap_4, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 11), gWorldmapMinimap_5, 0x6180);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 25, 16), gWorldmapMinimap_6, 0x6180);

    return;
}
