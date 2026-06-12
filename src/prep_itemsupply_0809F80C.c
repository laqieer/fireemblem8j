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

//! FE8U = 0x0809D570
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc)
{
    int i;

    proc->unk_38 = 0;
    proc->unk_36 = 0xff;

    if (GetUnitItemCount(proc->unit) == 0) {
        proc->unk_33 = 1;
    } else {
        proc->unk_33 = 0;
    }

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            proc->currentPage = pGMapBaseMenuProc->unk_2b;
        } else {
            proc->currentPage = 0;
        }
    } else {
        if (proc->unk_30 == 0) {
            struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
            proc->currentPage = pAtMenuProc->unk_32;
        } else {
            proc->currentPage = 0;
        }
    }

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++) {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }
    return;
}
