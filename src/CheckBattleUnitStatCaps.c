#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"

//! FE8U = 0x0802BE6C
void CheckBattleUnitStatCaps(struct Unit* unit, struct BattleUnit* bu) {
    if ((unit->maxHP + bu->changeHP) > UNIT_MHP_MAX(unit))
        bu->changeHP = UNIT_MHP_MAX(unit) - unit->maxHP;

    if ((unit->pow + bu->changePow) > UNIT_POW_MAX(unit))
        bu->changePow = UNIT_POW_MAX(unit) - unit->pow;

    if ((unit->skl + bu->changeSkl) > UNIT_SKL_MAX(unit))
        bu->changeSkl = UNIT_SKL_MAX(unit) - unit->skl;

    if ((unit->spd + bu->changeSpd) > UNIT_SPD_MAX(unit))
        bu->changeSpd = UNIT_SPD_MAX(unit) - unit->spd;

    if ((unit->def + bu->changeDef) > UNIT_DEF_MAX(unit))
        bu->changeDef = UNIT_DEF_MAX(unit) - unit->def;

    if ((unit->res + bu->changeRes) > UNIT_RES_MAX(unit))
        bu->changeRes = UNIT_RES_MAX(unit) - unit->res;

    if ((unit->lck + bu->changeLck) > UNIT_LCK_MAX(unit))
        bu->changeLck = UNIT_LCK_MAX(unit) - unit->lck;
}
