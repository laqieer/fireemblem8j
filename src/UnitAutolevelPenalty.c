#include "global.h"

#include "bmunit.h"

//! FE8U = 0x08017D84
void UnitAutolevelPenalty(struct Unit* unit, u8 classId, int levelCount) {
    int level = unit->level;

    if (levelCount && level > unit->pCharacterData->baseLevel) {
        levelCount = level - levelCount;

        if (levelCount < unit->pCharacterData->baseLevel)
            levelCount = unit->pCharacterData->baseLevel;

        unit->maxHP = unit->pCharacterData->baseHP  + unit->pClassData->baseHP;
        unit->pow   = unit->pCharacterData->basePow + unit->pClassData->basePow;
        unit->skl   = unit->pCharacterData->baseSkl + unit->pClassData->baseSkl;
        unit->spd   = unit->pCharacterData->baseSpd + unit->pClassData->baseSpd;
        unit->def   = unit->pCharacterData->baseDef + unit->pClassData->baseDef;
        unit->res   = unit->pCharacterData->baseRes + unit->pClassData->baseRes;
        unit->lck   = unit->pCharacterData->baseLck;

        unit->level = levelCount;
        UnitAutolevel(unit);
        unit->level = level;
    }
}
