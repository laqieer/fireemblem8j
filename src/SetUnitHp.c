#include "global.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline int GetUnitMaxHp(struct Unit *unit)
{
    return unit->maxHP + GetItemHpBonus((u16) GetUnitEquippedWeapon(unit));
}

void SetUnitHp(struct Unit *unit, int value)
{
    unit->curHP = value;
    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);
}
