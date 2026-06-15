#include "global.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline int GetUnitMaxHp(struct Unit *unit)
{
    return unit->maxHP + GetItemHpBonus((u16) GetUnitEquippedWeapon(unit));
}

void AddUnitHp(struct Unit *unit, int amount)
{
    int hp = unit->curHP;
    hp += amount;
    if (hp > GetUnitMaxHp(unit))
        hp = GetUnitMaxHp(unit);
    if (hp < 0)
        hp = 0;
    unit->curHP = hp;
}
