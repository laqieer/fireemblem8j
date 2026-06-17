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
extern s16 * gMinimapFrontWinBuf;
extern s16 gMinimapWinBuf[2][320];
extern s16 * gMinimapBackWinBuf;
extern s16 * gMinimapDisplayedWinBuf;
void Minimap_OnHBlank();

void Minimap_InitOpenAnim(struct MinimapProc* proc) {
    gMinimapFrontWinBuf = gMinimapWinBuf[1];
    gMinimapBackWinBuf = gMinimapWinBuf[0];
    gMinimapDisplayedWinBuf = gMinimapWinBuf[1];

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    SetWin0Box(DISPLAY_WIDTH, 0, 0, DISPLAY_HEIGHT);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropB(1);

    SetBlendConfig(3, 16, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    proc->animClock = 0;

    SetPrimaryHBlankHandler(Minimap_OnHBlank);

    return;
}
