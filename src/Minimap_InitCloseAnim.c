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

void Minimap_InitCloseAnim(struct MinimapProc* proc) {
    PlaySoundEffect(SONG_79);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendConfig(3, 16, 0, 4);

    gMinimapFrontWinBuf = gMinimapWinBuf[1];
    gMinimapBackWinBuf = gMinimapWinBuf[0];
    gMinimapDisplayedWinBuf = gMinimapWinBuf[1];

    proc->animClock = 0;

    return;
}
