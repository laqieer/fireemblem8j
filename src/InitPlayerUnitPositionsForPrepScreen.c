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

//! FE8U = 0x08012360
void InitPlayerUnitPositionsForPrepScreen(void)
{
    int i;
    s8 x, y;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (uDef->charIndex == 0)
        {
            unit->xPos = -1;
            continue;
        }

        if (unit->state & (US_UNAVAILABLE | US_BIT25))
        {
            continue;
        }

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
        {
            unit->xPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX;
            unit->yPos = GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY;
            continue;
        }

        GenUnitDefinitionFinalPosition(uDef, &x, &y, 0);

        unit->xPos = x;
        unit->yPos = y;

        uDef++;
    }

    return;
}
