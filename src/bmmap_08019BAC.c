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
static void RenderBmMapLine(u16 yOffset);

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
void DisplayMovementViewTile(u16* bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap);

void RenderBmMapLine(u16 yOffset) {
    u16 xBmMap = (gBmSt.camera.x >> 4);
    u16 yBmMap = (gBmSt.camera.y >> 4) + yOffset;

    u16 xTileMap = ((gBmSt.camera.x >> 4) - gBmSt.mapRenderOrigin.x);
    u16 yTileMap = ((gBmSt.camera.y >> 4) - gBmSt.mapRenderOrigin.y + yOffset) & 0xF;

    int ix;

    if (!(gBmSt.gameStateBits & 1)) {
        for (ix = 15; ix >= 0; --ix) {
            DisplayBmTile(gBG3TilemapBuffer,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);
        }

        BG_EnableSyncByMask(1 << 3);
    } else {
        for (ix = 15; ix >= 0; --ix) {
            DisplayBmTile(gBG3TilemapBuffer,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);

            DisplayMovementViewTile(gBG2TilemapBuffer,
                (xBmMap + ix), yBmMap,
                (xTileMap + ix) & 0xF, yTileMap);
        }

        BG_EnableSyncByMask((1 << 3) | (1 << 2));
    }
}
