#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "constants/characters.h"
#include "constants/items.h"

extern inline int GetUnitPower(struct Unit *unit)
{
    return unit->pow + GetItemPowBonus((u16) GetUnitEquippedWeapon(unit));
}

int GetUnitMagBy2Range(struct Unit *unit)
{
    if (unit->pCharacterData->number == CHARACTER_FOMORTIIS)
    {
        return GetItemMaxRange(ITEM_NIGHTMARE);
    }
    else
    {
        int result = GetUnitPower(unit) / 2;

        if (result < 5)
            result = 5;

        return result;
    }
}
