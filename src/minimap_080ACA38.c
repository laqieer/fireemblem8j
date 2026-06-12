extern int InitMinimapWindowBuffers();
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
/* TU-private data externs bound at their JP addresses */
extern s16 * gMinimapBackWinBuf;

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

//! FE8U = 0x080A8020
void Minimap_OpenAnim(struct MinimapProc* proc) {
    int unk;
    int i;
    int angle;
    struct Vec2 arr[4];

    SetBlendConfig(3, 16, 0, proc->animClock / 4);

    unk = Interpolate(INTERPOLATE_RCUBIC, 0, 256, proc->animClock, 16);
    angle = unk / 4 - 64;

    arr[0].x = -proc->xRegionRadius;
    arr[0].y = -proc->yRegionRadius;

    arr[1].x = +proc->xRegionRadius;
    arr[1].y = -proc->yRegionRadius;

    arr[2].x = +proc->xRegionRadius;
    arr[2].y = +proc->yRegionRadius;

    arr[3].x = -proc->xRegionRadius;
    arr[3].y = +proc->yRegionRadius;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS(angle) * arr[i].x) - (SIN(angle) * arr[i].y);
        a2 = (SIN(angle) * arr[i].x) + (COS(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    InitWindowScanlineBounds(gMinimapBackWinBuf);

    RasterizeWindowEdge(gMinimapBackWinBuf, arr[0].x, arr[0].y, arr[1].x, arr[1].y);
    RasterizeWindowEdge(gMinimapBackWinBuf, arr[1].x, arr[1].y, arr[2].x, arr[2].y);
    RasterizeWindowEdge(gMinimapBackWinBuf, arr[2].x, arr[2].y, arr[3].x, arr[3].y);
    RasterizeWindowEdge(gMinimapBackWinBuf, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    InitMinimapWindowBuffers();

    proc->animClock++;

    if (proc->animClock > 16) {
        Proc_Break(proc);
    }

    return;
}
