#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "bmlib.h"
#include "bmunit.h"
#include "ctc.h"

#include "minimap.h"
#include "constants/songs.h"

struct MinimapProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int xCameraSpeed;
    /* 30 */ int yCameraSpeed;
    /* 34 */ int xRegionRadius;
    /* 38 */ int yRegionRadius;
    /* 3C */ int xScreen;
    /* 40 */ int yScreen;
    /* 44 */ STRUCT_PAD(0x44, 0x4A);
    /* 4A */ s16 cameraMoved;
    /* 4C */ s16 animClock;
};

extern u8 gGfx_MinimapTiles[];
extern u16 gPal_MinimapTiles[];
extern u16 gPal_Minimap_0[];







void ApplyMinimapGraphics(int);
void Minimap_InitProcVars(struct MinimapProc*);

void Minimap_Init(ProcPtr proc);
void Minimap_AdjustDisplay(struct MinimapProc* proc);
void Minimap_InitOpenAnim(struct MinimapProc* proc);
void Minimap_OpenAnim(struct MinimapProc* proc);
void InitMinimapFlashPalette(void);
void Minimap_Main(ProcPtr proc);
void Minimap_InitCloseAnim(struct MinimapProc* proc);
void Minimap_CloseAnim(struct MinimapProc* proc);
void Minimap_AdjustCursorOnClose(struct MinimapProc* proc);



/* prototypes for same-file helpers called by this run */
int NormalizeWaterMinimapTerrain(int terrainId);

//! FE8U = 0x080A769C
int GetMinimapWaterKindAt(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x]);
    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}

//! FE8U = 0x080A7730
int GetMinimapRiverKindAt(int x, int y) {
    int terrainId;

    int index = 0;

    terrainId = gBmMapTerrain[y + 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_REGULAR)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y - 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_REGULAR)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x + 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_REGULAR)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x - 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_REGULAR)) {
        index += 1;
    }

    return index;
}
