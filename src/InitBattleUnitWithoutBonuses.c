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

//! FE8U = 0x0802A5D4
void InitBattleUnitWithoutBonuses(struct BattleUnit* bu, struct Unit* unit) {
    InitBattleUnit(bu, unit);

    bu->unit.maxHP = unit->maxHP;
    bu->unit.pow = unit->pow;
    bu->unit.skl = unit->skl;
    bu->unit.spd = unit->spd;
    bu->unit.def = unit->def;
    bu->unit.lck = unit->lck;
    bu->unit.res = unit->res;

    bu->unit.conBonus = UNIT_CON_BASE(unit);
}
