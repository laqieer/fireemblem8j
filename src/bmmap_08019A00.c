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
void RenderBmMapColumn(u16 xOffset);
void RenderBmMapLine(u16 yOffset);

void UpdateBmMapDisplay(void) {
    // TODO: figure out

    if (gBmSt.camera.x != gBmSt.cameraPrevious.x) {
        if (gBmSt.camera.x > gBmSt.cameraPrevious.x) {
            if (((gBmSt.camera.x - 1) ^ (gBmSt.cameraPrevious.x - 1)) & 0x10)
                RenderBmMapColumn(15);
        } else {
            if ((gBmSt.camera.x ^ gBmSt.cameraPrevious.x) & 0x10)
                RenderBmMapColumn(0);
        }
    }

    if (gBmSt.camera.y != gBmSt.cameraPrevious.y) {
        if (gBmSt.camera.y > gBmSt.cameraPrevious.y) {
            if (((gBmSt.camera.y - 1) ^ (gBmSt.cameraPrevious.y - 1)) & 0x10)
                RenderBmMapLine(10);
        } else {
            if ((gBmSt.camera.y ^ gBmSt.cameraPrevious.y) & 0x10)
                RenderBmMapLine(0);
        }
    }

    gBmSt.cameraPrevious = gBmSt.camera;

    BG_SetPosition(3,
        gBmSt.camera.x - gBmSt.mapRenderOrigin.x * 16,
        gBmSt.camera.y - gBmSt.mapRenderOrigin.y * 16
    );

    // TODO: GAME STATE BITS CONSTANTS
    if (gBmSt.gameStateBits & 1) {
        BG_SetPosition(2,
            gBmSt.camera.x - gBmSt.mapRenderOrigin.x * 16,
            gBmSt.camera.y - gBmSt.mapRenderOrigin.y * 16
        );
    }
}
