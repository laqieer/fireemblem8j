#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "icon.h"
#include "bmitemuse.h"
#include "face.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "sysutil.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809BE60
void StartPrepItemTradeScreenProcAtSlot(struct Unit* unitA, struct Unit* unitB, int rightItemIdx, ProcPtr parent) {
    struct PrepMenuTradeProc* proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    // Position the cursor on this item slot on unit B's inventory
    proc->unk_40 = rightItemIdx;

    return;
}
