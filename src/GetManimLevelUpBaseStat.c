#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

int GetManimLevelUpBaseStat(int actor_id, int stat_num)
{
    // getting the original unit to ensure we get the base stats
    struct Unit * unit = GetUnit(gManimSt.actor[actor_id].unit->index);

    switch (stat_num) {
        case 0:
            return gManimSt.actor[actor_id].bu->levelPrevious;

        case 1:
            return unit->maxHP;

        case 2:
            return unit->pow;

        case 3:
            return unit->skl;

        case 4:
            return unit->spd;

        case 5:
            return unit->lck;

        case 6:
            return unit->def;

        case 7:
            return unit->res;

        case 8:
            return UNIT_CON_BASE(unit);

        default:
            return 0;
    }
}
