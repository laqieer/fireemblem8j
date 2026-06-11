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

//! FE8U = 0x0809EB78
void PrepItemList_Init(struct PrepItemListProc * proc)
{
    int i;

    struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);

    proc->unk_36 = 0;
    proc->unk_34 = 0xff;

    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();

        if (pGMapBaseMenuProc) {
            proc->currentPage = pGMapBaseMenuProc->unk_2a;
        } else {
            proc->currentPage = 0;
        }
    } else {
        proc->currentPage = pAtMenuProc->unk_31;
    }

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++) {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }

    return;
}
