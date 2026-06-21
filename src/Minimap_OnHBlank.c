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
extern s16 gMinimapWinBuf[2][320];
extern s16 *gMinimapFrontWinBuf;
extern s16 *gMinimapBackWinBuf;
extern s16 *gMinimapDisplayedWinBuf;
extern u16 *gMinimapObjectFlashPal;
void Minimap_Init(ProcPtr proc);

//! FE8U = 0x080AC8DC
void Minimap_OnHBlank() {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        gMinimapDisplayedWinBuf = gMinimapFrontWinBuf;
        vcount = 0;
    }

    REG_WIN0H = WIN_RANGE(gMinimapDisplayedWinBuf[vcount*2], gMinimapDisplayedWinBuf[vcount*2 + 1]);

    return;
}
