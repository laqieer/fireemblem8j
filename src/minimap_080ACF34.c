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



//! FE8U = 0x080A851C
void Minimap_PutViewport(struct MinimapProc* proc) {
    int xScreen;
    int yScreen;

    u16 viewportSprite[] = {
        4,
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(-1), OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(-1) + OAM1_VFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x28),
    };

    xScreen = proc->xScreen + gBmSt.camera.x / 4;
    yScreen = proc->yScreen + gBmSt.camera.y / 4;

    CallARM_PushToSecondaryOAM(xScreen, yScreen, viewportSprite, 0);

    return;
}
