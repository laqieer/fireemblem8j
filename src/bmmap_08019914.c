#include "global.h"

#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmlib.h"

#include "constants/terrains.h"
#include "constants/chapters.h"
 void BmMapInit(void* buffer, u8*** outHandle, int width, int height);

 void RenderBmMapColumn(u16 xOffset);
 void RenderBmMapLine(u16 yOffset);

 void RefreshUnitsOnBmMap(void);
 void RefreshTorchlightsOnBmMap(void);
 void RefreshMinesOnBmMap(void);

extern EWRAM_OVERLAY(bmstart) u16 gBmMapBuffer[0x800 / 2];

enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this (overlaps with a lot of other objects?)


extern EWRAM_DATA struct Vec2 gBmMapSize;

extern EWRAM_DATA u8** gBmMapUnit;
extern EWRAM_DATA u8** gBmMapTerrain;
extern EWRAM_DATA u8** gBmMapMovement;
extern EWRAM_DATA u8** gBmMapRange;
extern EWRAM_DATA u8** gBmMapFog;
extern EWRAM_DATA u8** gBmMapHidden;
extern EWRAM_DATA u8** gBmMapOther;










extern EWRAM_DATA u8 gWorkingMovementScript[0x40];






extern u8*   gTilesetTerrainLookup;
extern u16** gBmMapBaseTiles;

/* prototypes for same-file helpers called by this run */
void DisplayBmTile(u16* bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap);

void RenderBmMap(void) {
    int ix, iy;

    gBmSt.mapRenderOrigin.x = gBmSt.camera.x >> 4;
    gBmSt.mapRenderOrigin.y = gBmSt.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            DisplayBmTile(gBG3TilemapBuffer, ix, iy,
                (short) gBmSt.mapRenderOrigin.x + ix, (short) gBmSt.mapRenderOrigin.y + iy);

    BG_EnableSyncByMask(1 << 3);
    BG_SetPosition(3, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
}
