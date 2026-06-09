#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"

//! FE8U = 0x0809FE1C
void WmSell_OnHBlank(void) {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT) {
        vcount = 0;
    }

    if (vcount == 12) {
        REG_BLDCNT = 200;
    }

    if ((vcount == 52) || (vcount == 0)) {
        REG_BLDCNT = 578;
    }

    return;
}

//! FE8U = 0x0809FE58
void WmSell_Init(struct WmSellProc* proc) {
    proc->unk_34 = 0;
    proc->unk_32 = 0xff;
    proc->unk_30 = 0;
    return;
}
