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
u16* GetMinimapTerrainCellAt(int x, int y);
u16* GetMinimapObjectCellAt(int x, int y);

//! FE8U = 0x080A7C5C
void DrawMinimapInternal(u16* vram, int palId) {
    int iy;
    int ix;
    int chr;

    if (vram == 0) {
        vram = (void*)(BG_VRAM + 0x20);
    }

    chr = ((u32)vram << 15) >> 20;

    if (palId < 0) {
        palId = 3;
    }

    for (iy = 0; iy < gBmMapSize.y; iy += 2) {
        for (ix = 0; ix < gBmMapSize.x; ix += 2) {
            u16* iterA = GetMinimapTerrainCellAt(ix, iy);
            u16* iterB = GetMinimapTerrainCellAt(ix + 1, iy);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            iterA = GetMinimapTerrainCellAt(ix, iy + 1);
            iterB = GetMinimapTerrainCellAt(ix + 1, iy + 1);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            gBG1TilemapBuffer[TILEMAP_INDEX((ix / 2), (iy / 2))] = TILEREF(chr, palId);

            chr++;

            if ((gBmMapUnit[iy  ][ix  ] != 0) ||
                (gBmMapUnit[iy  ][ix+1] != 0) ||
                (gBmMapUnit[iy+1][ix  ] != 0) ||
                (gBmMapUnit[iy+1][ix+1] != 0)) {

                iterA = GetMinimapObjectCellAt(ix, iy);
                iterB = GetMinimapObjectCellAt(ix + 1, iy);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                iterA = GetMinimapObjectCellAt(ix, iy + 1);
                iterB = GetMinimapObjectCellAt(ix + 1, iy + 1);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                gBG0TilemapBuffer[TILEMAP_INDEX((ix / 2), (iy / 2))] = TILEREF(chr, (palId + 1));

                chr++;
            }

        }
    }

    return;
}
