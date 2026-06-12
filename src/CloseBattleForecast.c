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

void CloseBattleForecast()
{
    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);

    if (proc == 0)
        return;

    if (proc->ready == 0) {
        ClearBg0Bg1();
        Proc_End(proc);
        return;
    }
    Proc_Goto(proc, 1);
}
