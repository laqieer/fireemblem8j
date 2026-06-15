#include "global.h"
#include "bmunit.h"

int GetUnitPortraitId(struct Unit *unit)
{
    if (unit->pCharacterData->portraitId != 0)
        return unit->pCharacterData->portraitId;

    if (unit->pClassData->defaultPortraitId != 0)
        return unit->pClassData->defaultPortraitId;

    return 0;
}
