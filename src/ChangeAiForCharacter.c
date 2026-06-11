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

void ChangeUnitAi(struct Unit * unit, u8 ai1, u8 ai2, u8 unused);

//! FE8U = 0x08011D10
void ChangeAiForCharacter(u8 pid, u8 ai1, u8 ai2, u8 unused)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number == pid)
        {
            ChangeUnitAi(unit, ai1, ai2, unused);
        }
    }

    return;
}
