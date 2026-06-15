#include "global.h"
#include "bmunit.h"

int GetUnitMiniPortraitId(struct Unit *unit)
{
    int id;

    if (unit->pCharacterData->miniPortrait != 0)
        return unit->pCharacterData->miniPortrait + 0x7f00;

    if (unit->pCharacterData->portraitId != 0)
        id = unit->pCharacterData->portraitId;
    else if (unit->pClassData->defaultPortraitId != 0)
        id = unit->pClassData->defaultPortraitId;
    else
        id = 0;

    return id;
}
