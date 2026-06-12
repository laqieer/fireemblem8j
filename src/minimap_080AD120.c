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



/* prototypes for same-file helpers called by this run */
void Minimap_ApplyFlashPalette();
void Minimap_ApplyViewportFlashColor();
void Minimap_PutViewport(struct MinimapProc* proc);
void Minimap_AdjustDisplay(struct MinimapProc* proc);
void Minimap_HandleMoveInput(struct MinimapProc* proc);

//! FE8U = 0x080A8708
void Minimap_Main(ProcPtr proc) {
    Minimap_ApplyFlashPalette();

    Minimap_ApplyViewportFlashColor(proc);
    Minimap_AdjustDisplay(proc);
    Minimap_PutViewport(proc);
    Minimap_HandleMoveInput(proc);

    if (gKeyStatusPtr->heldKeys & (R_BUTTON | L_BUTTON)) {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
        SetBlendConfig(1, 8, 8, 0);
    } else {
        SetBlendTargetA(0, 0, 1, 1, 0);
        SetBlendTargetB(1, 1, 1, 1, 1);
        SetBlendConfig(3, 16, 0, 4);
    }

    if (((gBmSt.camera.x & 0xF) == 0) && ((gBmSt.camera.y & 0xF) == 0) && (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON))) {
        Proc_Break(proc);
    }

    return;
}
