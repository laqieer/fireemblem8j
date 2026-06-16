#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"
#include "constants/items.h"

extern u16 ItemBackupEvtBattle;

void EventBattleReloadBmStatus(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    unitA = GetUnit(gBattleActor.unit.index);
    unitB = GetUnit(gBattleTarget.unit.index);

    unitA->curHP = gBattleActor.unit.curHP;
    unitB->curHP = gBattleTarget.unit.curHP;

    gActionData.scriptedBattleHits = NULL;
    AiRefreshMap();

    if (ItemBackupEvtBattle != 0x0000FFFF)
    {
        unitA->items[0] = ItemBackupEvtBattle;
    }

    unitA->state &= ~(US_UNSELECTABLE);
    unitB->state &= ~(US_UNSELECTABLE);

    if (gBattleStats.config & BATTLE_CONFIG_MAPANIMS)
    {
        if (unitA->curHP == 0)
        {
            unitA->state |= (US_HIDDEN | US_DEAD);
        }

        if (unitB->curHP == 0)
        {
            unitB->state |= (US_HIDDEN | US_DEAD);
        }
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();

    return;
}
