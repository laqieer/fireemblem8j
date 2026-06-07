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

//! FE8U = 0x0809FD54
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc)
{
    struct PrepScreenItemListEnt* ent = &gPrepScreenItemList[proc->idxPerPage[proc->currentPage]];

    StartPrepItemTradeScreenProcAtSlot(
        proc->unit,
        GetUnitFromCharId(ent->pid),
        ent->itemSlot,
        proc
    );

    return;
}

//! FE8U = 0x0809FD88
void StartPrepItemListScreenProc(struct Unit* unit, ProcPtr parent) {
    struct PrepItemListProc* proc = Proc_StartBlocking(ProcScr_PrepItemListScreen, parent);
    proc->unit = unit;
    return;
}
