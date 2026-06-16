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

void SyncUnitDeploymentState(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_DEAD)
        {
            continue;
        }

        if (unit->state & (US_NOT_DEPLOYED | US_BIT16))
        {
            unit->xPos = -1;
            unit->state |= US_HIDDEN;
            continue;
        }

        unit->state &= ~(US_HIDDEN);

        if (!(gBmSt.gameStateBits & BM_FLAG_LINKARENA) && unit->xPos == -1)
        {
            AssignUnitToFreeDeploySlot(unit);
        }
    }

    return;
}
