#include "global.h"
#include <string.h>
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "muctrl.h"
#include "cp_utility.h"

extern inline const struct ClassData* GetClassData(int classId) {
    if (classId < 1)
        return NULL;

    return gClassData + (classId - 1);
}

extern inline const struct CharacterData* GetCharacterData(int charId) {
    if (charId < 1)
        return NULL;

    return gCharacterData + (charId - 1);
}

//! FE8U = 0x08017A5C
void UnitInitFromDefinition(struct Unit* unit, const struct UnitDefinition* uDef) {
    unit->pCharacterData = GetCharacterData(uDef->charIndex);

    if (uDef->classIndex)
        unit->pClassData = GetClassData(uDef->classIndex);
    else // such an overlooked feature
        unit->pClassData = GetClassData(unit->pCharacterData->defaultClass);

    unit->level = uDef->level;

    GenUnitDefinitionFinalPosition(uDef, &unit->xPos, &unit->yPos, FALSE);

    if (UNIT_IS_GORGON_EGG(unit)) {
        int i;

        // For gorgon eggs, set first item to zero
        // And store the other item ids in slots 1 through 4 for later initialization

        unit->items[0] = 0;

        for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
            unit->items[i + 1] = uDef->items[i];
    } else {
        int i;

        for (i = 0; (i < UNIT_DEFINITION_ITEM_COUNT) && (uDef->items[i]); ++i)
            UnitAddItem(unit, MakeNewItem(uDef->items[i]));
    }

    CharStoreAI(unit, uDef);
}
