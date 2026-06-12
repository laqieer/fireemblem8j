#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct PrepItemSuppyText PrepItemSuppyTexts;

//! FE8U = 0x0809E100
void PrepItemSupply_ClampScroll(struct PrepItemSupplyProc * proc)
{

    if (gPrepscreen_2 == 0) {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    } else {
        if (proc->idxPerPage[proc->currentPage] > (gPrepscreen_2 - 1)) {
            proc->idxPerPage[proc->currentPage] = gPrepscreen_2 - 1;
        }
    }

    if (gPrepscreen_2 > 6) {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > gPrepscreen_2) {
            proc->yOffsetPerPage[proc->currentPage] = (gPrepscreen_2 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);

    return;
}
