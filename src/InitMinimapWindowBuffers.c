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

//! FE8U = 0x080AC91C
void InitMinimapWindowBuffers() {
    s16* swap = gMinimapFrontWinBuf;
    gMinimapFrontWinBuf = gMinimapBackWinBuf;
    gMinimapBackWinBuf = swap;

    return;
}
