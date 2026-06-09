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
int GetMinimapConnectKindAt(int x, int y);
int GetMinimapSeaKindAt(int x, int y);
int GetMinimapWaterKindAt(int x, int y);
int GetMinimapRiverKindAt(int x, int y);
int GetMinimapCliffKindAt(int x, int y);
int GetMinimapStairTileAt(int x, int y);
int GetMinimapDoorTileAt(int x, int y);
int GetMinimapBridgeKindAt(int x, int y);

//! FE8U = 0x080A7A0C
int GetMinimapTileAt(int x, int y) {
    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_PLAINS:
            return 1;

        case TERRAIN_ROAD:
            return GetMinimapConnectKindAt(x, y) + 0x40;

        case TERRAIN_VILLAGE_REGULAR:
        case TERRAIN_VILLAGE_CLOSED:
        case TERRAIN_HOUSE:
        case TERRAIN_GATE_REGULAR:
        case TERRAIN_INN:
            return 2;

        case TERRAIN_ARMORY:
        case TERRAIN_VENDOR:
            return 3;

        case TERRAIN_ARENA_REGULAR:
            return 4;

        case TERRAIN_FORT:
            return 5;

        case TERRAIN_GATE_CASTLE:
        case TERRAIN_RUINS_VILLAGE:
            return 6;

        case TERRAIN_FOREST:
        case TERRAIN_SNAG:
            return 8;

        case TERRAIN_THICKET:
            return 9;

        case TERRAIN_SAND:
        case TERRAIN_DESERT:
            return 0xA;

        case TERRAIN_RIVER:
            return GetMinimapRiverKindAt(x, y) + 0x60;

        case TERRAIN_MOUNTAIN:
            return 0xB;

        case TERRAIN_PEAK:
            return 0x14;

        case TERRAIN_BRIDGE_REGULAR:
        case TERRAIN_BRIDGE_SNAG:
            return GetMinimapBridgeKindAt(x, y);

        case TERRAIN_WATER:
            return GetMinimapWaterKindAt(x, y) + 0x30;

        case TERRAIN_SEA:
        case TERRAIN_LAKE:
        case TERRAIN_GLACIER:
        case TERRAIN_SKY:
        case TERRAIN_DEEPS:
            return GetMinimapSeaKindAt(x, y) + 0x30;

        case TERRAIN_FLOOR_REGULAR:
        case TERRAIN_FLOOR_MAGIC:
        case TERRAIN_DECK:
            return 0xC;

        case TERRAIN_PILLAR:
            return 0xD;

        case TERRAIN_DOOR:
            return GetMinimapDoorTileAt(x, y);

        case TERRAIN_THRONE:
            return 0xE;

        case TERRAIN_CHEST_EMPTY:
        case TERRAIN_CHEST_FULL:
            return 0xF;

        case TERRAIN_RUINS_REGULAR:
            return 0x1A;

        case TERRAIN_DARK:
            return 0x1B;

        case TERRAIN_CLIFF:
        case TERRAIN_BONE:
            return GetMinimapCliffKindAt(x, y) + 0x50;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            return 0x13;

        case TERRAIN_SHIP_FLAT:
            return 0x3A;

        case TERRAIN_STAIRS:
            return GetMinimapStairTileAt(x, y);

        case TERRAIN_FENCE_REGULAR:
        case TERRAIN_WALL_REGULAR:
        case TERRAIN_WALL_DAMAGED:
        case TERRAIN_RUBBLE:
        case TERRAIN_ROOF:
        case TERRAIN_SHIP_WRECK:
        case TERRAIN_TILE_2C:
        case TERRAIN_TILE_2E:
        case TERRAIN_BARREL:
        case TERRAIN_GUNNELS:
        case TERRAIN_BRACE:
        case TERRAIN_MAST:
            return GetMinimapConnectKindAt(x, y) + 0x20;

        case TERRAIN_VALLEY:
            return 0x19;

        case TERRAIN_NONE:
        case TERRAIN_C_ROOM_09:
        case TERRAIN_BRIDGE_14:
        case TERRAIN_CHURCH:
        case TERRAIN_ARENA_30:
        case TERRAIN_FENCE_32:
        default:
            return 0;
    }
}
