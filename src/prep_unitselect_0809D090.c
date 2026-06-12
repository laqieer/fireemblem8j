#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

/* prototypes for same-file helpers called by this run */
s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc);

void PrepUnit_AdjustScrollToCursor(struct ProcPrepUnit *proc)
{
    if (ShouldPrepUnitMenuScroll(proc)) {
        int lst = proc->list_num_cur / 2;
        int dif = proc->yDiff_cur / 16;
        int amt = (PrepGetUnitAmount() - 1) >> 1;

        if (lst <= dif) {
            if (lst == 0)
                proc->yDiff_cur = 0;
            else
                proc->yDiff_cur = (lst - 1) * 16;

            if (lst <= dif)
                return;
        }

        if (lst == amt)
            proc->yDiff_cur = (lst - 5) * 16;
        else
            proc->yDiff_cur = (lst - 4) * 16;
    }
}
