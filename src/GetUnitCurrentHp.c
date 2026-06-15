#include "global.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline int GetUnitMaxHp(struct Unit *unit)
{
    return unit->maxHP + GetItemHpBonus((u16) GetUnitEquippedWeapon(unit));
}

int GetUnitCurrentHp(struct Unit *unit)
{
    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);
    return unit->curHP;
}
