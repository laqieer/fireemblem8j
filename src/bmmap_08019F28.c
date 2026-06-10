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







EWRAM_DATA static u16 sTilesetConfig[0x1000 + 0x200] = {};


extern EWRAM_DATA u8 gWorkingMovementScript[0x40];






extern u8*   gTilesetTerrainLookup;
extern u16** gBmMapBaseTiles;

int GetTerrainHealAmount(int terrainId) {
    return TerrainTable_HealAmount[terrainId];
}

s8 GetTerrainHealsStatus(int terrainId) {
    return TerrainTable_HealsStatus[terrainId];
}

void BlankTilesetConfigTiles(void) {
    const u16* tile = sTilesetConfig;

    // TODO: game state bits constants
    if (!IsActiveEventTextTypeOnMap() || (gBmSt.gameStateBits & 0x10)) {
        // TODO: macros?
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
    }

    // TODO: macro?
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}

void RevertMapChange(int id) {
    const struct MapChange* mapChange;
    u8 ix, iy;

    Decompress(GetChapterMapPointer(gPlaySt.chapterIndex), gBmMapBuffer);

    mapChange = GetMapChange(id);

    for (iy = mapChange->yOrigin; iy < (mapChange->yOrigin + mapChange->ySize); ++iy) {
        u16* itSource = (iy * gBmMapSize.x) + mapChange->xOrigin + (gBmMapBuffer + 1);
        u16* itDest   = gBmMapBaseTiles[iy] + mapChange->xOrigin;

        for (ix = mapChange->xOrigin; ix < (mapChange->xOrigin + mapChange->xSize); ++ix)
            *itDest++ = *itSource++;
    }
}
