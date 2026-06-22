#include "global.h"

#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bmsave.h"
#include "bmarena.h"
#include "bmmind.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"

//! FE8U = 0x08031960
int ArenaGetPowerRanking(struct Unit* unit, s8 opponentIsMagic) {
    int isMagic = opponentIsMagic;
    int result = unit->maxHP;

    result += unit->maxHP;
    result += unit->pow * 2;
    result += unit->skl * 2;
    result += unit->spd * 2;
    result += unit->lck;
    result += UNIT_CON_BASE(unit);

    if (isMagic) {
        result += GetUnitResistance(unit) * 2;
    } else {
        result += GetUnitDefense(unit) * 2;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_CRITBONUS) {
        result += GetUnitPower(unit);
    }

    return result;
}
