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

//! FE8U = 0x0809BE3C
void StartPrepItemTradeScreenProc(struct Unit* unitA, struct Unit* unitB, ProcPtr parent) {
    struct PrepMenuTradeProc* proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->unk_40 = -1;

    return;
}
