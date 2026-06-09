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



//! FE8U = 0x080A85E4
void Minimap_HandleMoveInput(struct MinimapProc* proc) {
    int x = gBmSt.camera.x;
    int y = gBmSt.camera.y;

    if (((x % 16) == 0) && ((y % 16) == 0)) {
        proc->xCameraSpeed = 0;
        proc->yCameraSpeed = 0;

        if (gKeyStatusPtr->heldKeys & DPAD_LEFT) {
            proc->xCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_RIGHT) {
            proc->xCameraSpeed = +8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_UP) {
            proc->yCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_DOWN) {
            proc->yCameraSpeed = +8;
            proc->cameraMoved = 1;
        }
    }

    x = x + proc->xCameraSpeed;
    y = y + proc->yCameraSpeed;

    if (x < 0) {
        x = 0;
    }

    if (x > gBmSt.cameraMax.x) {
        x = gBmSt.cameraMax.x;
    }

    if (y < 0) {
        y = 0;
    }

    if (y > gBmSt.cameraMax.y) {
        y = gBmSt.cameraMax.y;
    }

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    return;
}

//! FE8U = 0x080A86AC
void Minimap_InitProcVars(struct MinimapProc* proc) {
    proc->cameraMoved = 0;

    proc->xRegionRadius = gBmMapSize.x * 2;
    proc->yRegionRadius = gBmMapSize.y * 2;

    return;
}
