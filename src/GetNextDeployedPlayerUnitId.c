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

//! FE8U = 0x08012578
int GetNextDeployedPlayerUnitId(int index)
{
    for (; index < FACTION_GREEN; index++)
    {
        struct Unit * unit = GetUnit(index);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number == GetPlayerLeaderPid())
        {
            continue;
        }

        if (unit->state & US_UNAVAILABLE)
        {
            continue;
        }

        return index;
    }

    return 0;
}
