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
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"

void UnitLoadItemsFromDefinition(struct Unit* unit, const struct UnitDefinition* uDef) {
    int i;

    UnitClearInventory(unit);

    for (i = 0; (i < UNIT_DEFINITION_ITEM_COUNT) && (uDef->items[i]); ++i)
        UnitAddItem(unit, MakeNewItem(uDef->items[i]));
}
