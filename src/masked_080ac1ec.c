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



//! FE8U = 0x080A77D4
int GetMinimapCliffKindAt(int x, int y) {

    int terrainId = gBmMapTerrain[y][x];

    if ((gBmMapTerrain[y][x - 1] == terrainId) ||
        (gBmMapTerrain[y][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x] == TERRAIN_LAKE)) {
            return 4;
        }

        if ((gBmMapTerrain[y + 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x] == TERRAIN_LAKE)) {
            return 0;
        }

        if (gBmMapTerrain[y - 1][x] == TERRAIN_DESERT) {
            return 0xC;
        }

        return 8;
    }

    if ((gBmMapTerrain[y - 1][x] == terrainId) ||
        (gBmMapTerrain[y + 1][x] == terrainId)) {

        if ((gBmMapTerrain[y][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y][x + 1] == TERRAIN_LAKE)) {
            return 2;
        }

        if ((gBmMapTerrain[y][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y][x - 1] == TERRAIN_LAKE)) {
            return 6;
        }

        if (gBmMapTerrain[y][x + 1] == TERRAIN_DESERT) {
            return 0xD;
        }

        return 9;

    }

    if ((gBmMapTerrain[y + 1][x - 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x - 1] == TERRAIN_LAKE)) {
            return 5;
        }

        if ((gBmMapTerrain[y + 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x + 1] == TERRAIN_LAKE)) {
            return 1;
        }

        if (gBmMapTerrain[y - 1][x - 1] == TERRAIN_DESERT) {
            return 0xE;
        }

        return 10;
    }

    if ((gBmMapTerrain[y + 1][x + 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x - 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x + 1] == TERRAIN_LAKE)) {
            return 3;
        }

        if ((gBmMapTerrain[y + 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x - 1] == TERRAIN_LAKE)) {
            return 7;
        }

        if (gBmMapTerrain[y - 1][x + 1] == TERRAIN_DESERT) {
            return 0xF;
        }

        return 0xB;
    }

    return 8;
}
