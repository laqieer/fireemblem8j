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

extern struct Unknown03000600 gUnk_38[0x40];

void StoreUnitWordStructs(void)
{
    int i;
    struct Unknown03000600 * it = gUnk_38;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        it->pid = unit->pCharacterData->number;
        it->x = unit->xPos;
        it->y = unit->yPos;

        it++;
    }

    it->pid = 0;

    return;
}
