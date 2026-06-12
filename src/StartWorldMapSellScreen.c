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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_PrepWMShopSell[];

//! FE8U = 0x080A070C
void StartWorldMapSellScreen(struct Unit* unit, ProcPtr parent) {
    struct WmSellProc* proc = Proc_StartBlocking(gProcScr_PrepWMShopSell, parent);
    proc->unit = unit;

    return;
}
