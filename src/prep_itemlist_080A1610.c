#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809F370
void PrepItemList_ClampCursorAndScroll(struct PrepItemListProc* proc) {
    if (gPrepscreen_2 == 0) {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    } else {
        if (proc->idxPerPage[proc->currentPage] > gPrepscreen_2 - 1) {
            proc->idxPerPage[proc->currentPage] = gPrepscreen_2 - 1;
        }
    }

    if (gPrepscreen_2 > 6) {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > gPrepscreen_2) {
            proc->yOffsetPerPage[proc->currentPage] = (gPrepscreen_2 - 7) * 0x10;
        }
    }

    BG_SetPosition(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    return;
}
