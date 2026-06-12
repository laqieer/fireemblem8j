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



extern EWRAM_OVERLAY(0) s16 * gMinimapBackWinBuf;
extern EWRAM_OVERLAY(0) u16 * gMinimapObjectFlashPal;

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



//! FE8U = 0x080A8568
void Minimap_AdjustDisplay(struct MinimapProc* proc) {
    int x = (DISPLAY_WIDTH - (gBmMapSize.x * 4)) >> 1;
    int y = (DISPLAY_HEIGHT - (gBmMapSize.y * 4)) >> 1;

    if ((gBmMapSize.y * 4) > DISPLAY_HEIGHT - 16) {
        y = ((gBmMapSize.y * 4) - DISPLAY_HEIGHT + 16);
        y = ((gBmSt.camera.y << 16) / gBmSt.cameraMax.y) * y / 0x10000;
        y = 8 - y;
    }

    proc->xScreen = x;
    proc->yScreen = y;

    BG_SetPosition(0, -x, -y);
    BG_SetPosition(1, -x, -y);

    return;
}
