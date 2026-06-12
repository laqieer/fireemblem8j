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

EWRAM_DATA static u8 sBmMapUnitPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapTerrainPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapFogPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapHiddenPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapOtherPool[MAP_POOL_SIZE] = {};




extern EWRAM_DATA u8 gWorkingMovementScript[0x40];

static u8** sInitializingMap;

static u8 sBmMapMovementPool[MAP_POOL_SIZE];
static u8 sBmMapRangePool[MAP_POOL_SIZE];

extern u8*   gTilesetTerrainLookup;
extern u16** gBmMapBaseTiles;

/* prototypes for same-file helpers called by this run */
void ApplyWaterShadowsBmMap(void);
void BmMapInit(void* buffer, u8*** outHandle, int x, int y);
void BmMapFill(u8** map, int value);
void UnpackChapterMap(void* into, int chapterId);
void UnpackChapterMapGraphics(int chapterId);
void InitBaseTilesBmMap(void);
void RefreshTerrainBmMap(void);

void InitChapterMap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);
    UnpackChapterMapGraphics(chapterId);

    BmMapInit(sBmMapUnitPool,     &gBmMapUnit,     gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool,  &gBmMapTerrain,  gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapMovementPool, &gBmMapMovement, gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapRangePool,    &gBmMapRange,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapFogPool,      &gBmMapFog,      gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapHiddenPool,   &gBmMapHidden,   gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapOtherPool,    &gBmMapOther,    gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitBaseTilesBmMap();
    ApplyEnabledMapChanges();
    RefreshTerrainBmMap();
    
    if (gPlaySt.chapterIndex == CHAPTER_75)
        ApplyWaterShadowsBmMap();
}
