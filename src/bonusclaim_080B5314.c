#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"




 // maybe lower

extern struct BonusClaimEnt * CONST_DATA gpBonusClaimData;
extern struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList;
extern int* CONST_DATA gpBonusClaimItemCount;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

//! FE8U = 0x080B06FC
void BonusClaim_HBlankHandler(void) {

    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        vcount = 0;
    }

    if ((vcount & 1) == 0) {
        if (vcount < 100) {
            REG_BLDCNT = 200;
            // TODO: In "bb.c", REG_BLDY matches as vu8, but here it is vu16
            (*(vu16*)REG_ADDR_BLDY) = ((100 - vcount) * 16) / 100;
        }

        if (vcount == 0) {
            REG_BG0VOFS = gLCDControlBuffer.bgoffset[0].y;
        }

        if (vcount == 120) {
            REG_BG0VOFS = 4;
        }
    }

    return;
}
