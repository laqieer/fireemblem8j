#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

void NewBattleForecast(ProcPtr unused) {

    struct BattleForecastProc* proc;

    if (gPlaySt.config.battleForecastType == 2) {
        ResetTextFont();
        return;
    }

    proc = Proc_Start(gProcScr_BKSEL, PROC_TREE_3);
    proc->ready = 0;

    switch (gPlaySt.config.battleForecastType) {
        case 0:
            proc->frameKind = 1;
            break;

        case 1:
            proc->frameKind = 2;
            break;
    }

    BmMapFill(gBmMapMovement, -1);
}
