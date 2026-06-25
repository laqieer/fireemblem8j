#include "global.h"
#include "bmunit.h"
#include "constants/characters.h"

extern CONST_DATA int sStatusNameTextIdLookup[];

char * GetUnitRescueName(struct Unit * unit)
{
    if (!unit->rescue)
        return GetStringFromIndex(sStatusNameTextIdLookup[0]);

    return GetStringFromIndex(gUnitLookup[unit->rescue]->pCharacterData->nameTextId);
}
