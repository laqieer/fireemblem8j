#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "constants/classes.h"

extern inline int GetUnitMaxHp(struct Unit * unit)
{
    return unit->maxHP + GetItemHpBonus((u16)GetUnitEquippedWeapon(unit));
}

void UnitAutolevelCore(struct Unit * unit, u8 classId, int levelCount);
void UnitAutolevelPenalty(struct Unit * unit, u8 classId, int levelCount);

void UnitApplyBonusLevels(struct Unit * unit, int levelCount)
{
    if (levelCount && !UNIT_IS_GORGON_EGG(unit))
    {
        if (levelCount > 0)
            UnitAutolevelCore(unit, unit->pClassData->number, levelCount);
        else if (levelCount < 0)
            UnitAutolevelPenalty(unit, unit->pClassData->number, -levelCount);

        UnitCheckStatCaps(unit);

        unit->curHP = GetUnitMaxHp(unit);
    }
}
