#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

/* variables */
extern EWRAM_DATA u32 gBonusContentClaimFlags;
extern EWRAM_DATA u8 gSuspendSaveIdOffset;

void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest)
{
    int i;
    struct GameSavePackedUnit unitp;


    unitp.pid = UNIT_CHAR_ID(unit);
    unitp.jid = unit->pClassData->number;

    if (NULL == unit->pCharacterData) {
        struct Unit tmp_unit;
        unit = &tmp_unit;
        ClearUnit(&tmp_unit);
        unitp.pid = 0;
        unitp.jid = 0;
    }
#if BUGFIX
    else {
        unitp.pid = unit->pinfo->id;
        unitp.jid = unit->jinfo->id;
    }
#endif

    unitp.level = unit->level;
    unitp.exp = unit->exp;
    unitp.xPos = unit->xPos;
    unitp.yPos = unit->yPos;

    unitp.max_hp = unit->maxHP;
    unitp.pow = unit->pow;
    unitp.skl = unit->skl;
    unitp.spd = unit->spd;
    unitp.def = unit->def;
    unitp.res = unit->res;
    unitp.lck = unit->lck;
    unitp.con_bonus = unit->conBonus;
    unitp.mov_bonus = unit->movBonus;

    unitp.item1 = unit->items[0];
    unitp.item2 = unit->items[1];
    unitp.item3 = unit->items[2];
    unitp.item4 = unit->items[3];
    unitp.item5 = unit->items[4];

    unitp.flag = 0;

    if (US_DEAD & unit->state)
        unitp.flag |= PACKED_US_DEAD;

    if (US_NOT_DEPLOYED & unit->state) 
        unitp.flag |= PACKED_US_UNDEPLOYED;

    if (US_SOLOANIM_1 & unit->state)
        unitp.flag |= PACKED_US_SOLO_ANIM1;

    if (US_SOLOANIM_2 & unit->state)
        unitp.flag |= PACKED_US_SOLO_ANIM2;

    if (US_GROWTH_BOOST & unit->state)
        unitp.flag |= PACKED_US_METIS_TOME;

    if (US_BIT16 & unit->state)
        unitp.flag |= PACKED_US_B4;

    if (US_BIT25 & unit->state)
        unitp.flag |= PACKED_US_B5;

    if (US_BIT21 & unit->state)
        unitp.flag |= PACKED_US_NEW_FRIEND;

    for (i = 0; i < 8; i++)
        unitp.wpnRanks[i] = unit->ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unitp.supports[i] = unit->supports[i];

    WriteAndVerifySramFast(&unitp, sram_dest, sizeof(unitp));
}
