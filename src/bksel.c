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




u8 StartBattleForecastHelpBox(ProcPtr parent, struct SelectTarget * target)
{
    int x;

    struct BattleForecastProc* proc = Proc_Find(gProcScr_BKSEL);
    if (proc == 0)
        return 0;

    if (proc->needContentUpdate != 0)
        return 0;

    if (proc->side < 0)
        x = 0;
    else
        x = 20;

    LoadHelpBoxGfx(0, -1);

    switch (proc->frameKind) {
    case 1:
        StartMovingHelpBoxExt(&gHelpInfo_MbpHp, parent, x, 0);
        break;

    case 2:
        StartMovingHelpBoxExt(&gHelpInfo_CbpHp, parent, x, 0);
        break;
    }
    return 0;
}

u16 GetBkselHelpBoxMsg(int wt, s8 isEffective)
{
    static u16 lut[] = {
        0x500, 0x502, 0x504, 0x501, 0x503, 0x505,
    };

    int idx = isEffective != 0 ? 3 : 0;

    if (wt < 0)
        idx += 2;

    if (wt > 0)
        idx += 1;

    return lut[idx];
}

void HbPopulate_BkselWTriEffA(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->mid = GetBkselHelpBoxMsg(gBattleActor.wTriangleHitBonus, proc2->isEffectiveA);
}

void HbPopulate_BkselWTriEffB(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->mid = GetBkselHelpBoxMsg(gBattleTarget.wTriangleHitBonus, proc2->isEffectiveB);
}
