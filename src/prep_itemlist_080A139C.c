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

//! FE8U = 0x0809F0FC
void PrepItemList_OnEnd(struct PrepItemListProc * proc)
{
    if (gGMData.state.bits.state_0) {
        struct GMapBaseMenuProc* pGMapBaseMenuProc = FindGMapBaseMenu();
        if (pGMapBaseMenuProc) {
            pGMapBaseMenuProc->unk_2a = proc->currentPage;
        }
    } else {
        struct ProcAtMenu* pAtMenuProc = Proc_Find(ProcScr_AtMenu);
        pAtMenuProc->unk_31 = proc->currentPage;
    }

    EndAllProcChildren(proc);
    EndFaceById(0);
    EndMuralBackground_();

    return;
}
