#include "gbafe.h"

/* JP (early-build) LoadUnit. bmunit.h declares GetUnitMaxHp/SetUnitHp as
 * out-of-line prototypes, but this JP build inlines them (as fe8u's headers
 * do). Provide the inline bodies locally so the calls fold in and byte-match. */
static inline int GetUnitMaxHp_(struct Unit * unit)
{
    return unit->maxHP + GetItemHpBonus((u16)GetUnitEquippedWeapon(unit));
}

static inline void SetUnitHp_(struct Unit * unit, int value)
{
    unit->curHP = value;

    if (unit->curHP > GetUnitMaxHp_(unit))
        unit->curHP = GetUnitMaxHp_(unit);
}

struct Unit * LoadUnit(const struct UnitDefinition * uDef)
{
    struct UnitDefinition buf;

    struct Unit * unit = NULL;

    if (uDef->genMonster) {
        u32 packedItems;
        u16 item1, item2;

        u16 monsterClass = GenerateMonsterClass(uDef->classIndex);

        buf = *uDef;

        buf.autolevel = TRUE;
        buf.classIndex = monsterClass;
        buf.level = GenerateMonsterLevel(uDef->level);

        packedItems = GenerateMonsterItems(monsterClass);

        item1 = packedItems >> 16;
        item2 = packedItems & 0xFFFF;

        buf.items[0] = item1;
        buf.items[1] = item2;
        buf.items[2] = 0;
        buf.items[3] = 0;

        if ((GetItemWeaponEffect(item1) == 1) || !item2)
            buf.itemDrop = FALSE;
        else
            buf.itemDrop = TRUE;

        if (CanClassWieldWeaponType(monsterClass, ITYPE_BOW) == TRUE) {
            buf.ai[2] = buf.ai[2] & (1 | 2 | 4);
            buf.ai[2] = buf.ai[2] | (8 | 32);
        }

        uDef = &buf;
    }

    switch (uDef->allegiance) {

    case 0:
        unit = GetFreeBlueUnit(uDef);
        break;

    case 2:
        unit = GetFreeUnit(FACTION_RED);
        break;

    case 1:
        unit = GetFreeUnit(FACTION_GREEN);
        break;

    }

    if (!unit)
        return NULL;

    ClearUnit(unit);

    UnitInitFromDefinition(unit, uDef);
    UnitLoadStatsFromChracter(unit, unit->pCharacterData);
    UnitHideIfUnderRoof(unit);

    if (UNIT_IS_GORGON_EGG(unit))
        SetUnitStatus(unit, UNIT_STATUS_RECOVER);

    if (uDef->autolevel) {
        if (UNIT_FACTION(unit) == FACTION_BLUE) {
            UnitAutolevelRealistic(unit);
            UnitAutolevelWExp(unit, uDef);
        } else {
            UnitAutolevel(unit);
            UnitAutolevelWExp(unit, uDef);
            UNIT_LEADER_CHARACTER(unit) = uDef->leaderCharIndex;
        }

        if (UNIT_IS_GORGON_EGG(unit))
            unit->maxHP = (unit->level + 1) * 5;
    }

    FixROMUnitStructPtr(unit);
    UnitLoadSupports(unit);

    if (uDef->itemDrop)
        unit->state |= US_DROP_ITEM;

    UnitCheckStatCaps(unit);

    unit->curHP = GetUnitMaxHp_(unit);

    if (UNIT_IS_GORGON_EGG(unit))
        SetUnitHp_(unit, 5);

    return unit;
}
