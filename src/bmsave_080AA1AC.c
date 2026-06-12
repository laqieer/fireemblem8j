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

void LoadSavedUnit(const void *sram_src, struct Unit *unit)
{
    int i;
    struct GameSavePackedUnit unitp;

    ReadSramFast(sram_src, &unitp, sizeof(unitp));

    unit->pCharacterData = GetCharacterData(unitp.pid);
    unit->pClassData = GetClassData(unitp.jid);
    unit->level = unitp.level;
    unit->exp = unitp.exp;
    unit->xPos = unitp.xPos;
    unit->yPos = unitp.yPos;

    unit->maxHP = unitp.max_hp;
    unit->pow = unitp.pow;
    unit->skl = unitp.skl;
    unit->spd = unitp.spd;
    unit->def = unitp.def;
    unit->res = unitp.res;
    unit->lck = unitp.lck;
    unit->conBonus = unitp.con_bonus;
    unit->movBonus = unitp.mov_bonus;

    unit->items[0] = unitp.item1;
    unit->items[1] = unitp.item2;
    unit->items[2] = unitp.item3;
    unit->items[3] = unitp.item4;
    unit->items[4] = unitp.item5;

    if (unit->exp > 99)
        unit->exp = -1;

    unit->state = 0;

    if (PACKED_US_DEAD & unitp.flag)
        unit->state  = US_HIDDEN | US_DEAD;

    if (PACKED_US_UNDEPLOYED & unitp.flag)
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

    if (PACKED_US_SOLO_ANIM1 & unitp.flag)
        unit->state |= US_SOLOANIM_1;

    if (PACKED_US_SOLO_ANIM2 & unitp.flag)
        unit->state |= US_SOLOANIM_2;

    if (PACKED_US_METIS_TOME & unitp.flag)
        unit->state |= US_GROWTH_BOOST;

    if (PACKED_US_B4 & unitp.flag)
        unit->state |= US_BIT16;

    if (PACKED_US_B5 & unitp.flag)
        unit->state |= US_BIT25;

    if (PACKED_US_NEW_FRIEND & unitp.flag)
        unit->state |= US_BIT21;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unitp.wpnRanks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unitp.supports[i];

    SetUnitHp(unit, GetUnitMaxHp(unit));
    unit->supportBits = 0;

    /* mins zero */
    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}
