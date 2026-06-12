#include "global.h"

#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;

extern EWRAM_OVERLAY(0) int sSupportScreenUnitCount;
extern EWRAM_OVERLAY(0) u16 gUisupport_0[0xC00];
extern EWRAM_OVERLAY(0) u16 gUisupport_1[0x2706];

extern u16 CONST_DATA gSprite_SupportScreenSuccessBox[];

extern u16 CONST_DATA gSprite_SupportScreenBanner[];

int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

//! FE8U = 0x080A2730
void SupportSubScreen_DrawScrolledTilemaps(u32 xBase) {
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++) {
        u32 x = ix + xBase;
        if (x < 30) {

            for (iy = 0; iy < 20; iy++) {
                *(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUisupport_0 + TILEMAP_INDEX(x, iy + 0x00));
                *(gBG1TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUisupport_0 + TILEMAP_INDEX(x, iy + 0x20));
                *(gBG2TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUisupport_0 + TILEMAP_INDEX(x, iy + 0x40));
            }

        } else {
            for (iy = 0; iy < 20; iy++) {
                *(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
                *(gBG1TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
                *(gBG2TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
            }
        }
    }

    BG_EnableSyncByMask(7);

    return;
}
