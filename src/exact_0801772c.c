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




 // Purple units





/* prototypes for same-file helpers called by this run */
struct Unit* LoadUnit(const struct UnitDefinition* uDef);

void UnitRemoveInvalidItems(struct Unit* unit) {
    u16 items[UNIT_ITEM_COUNT + 1], i;
    u16* it = items;

    // Build item buffer by iterating through unit's items and skipping blanks

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (unit->items[i])
            *it++ = unit->items[i];

        unit->items[i] = 0; // Null the item from the unit
    }

    *it = 0; // null-terminate buffer

    // Write buffered items

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (!items[i])
            return; // Stop now if we reached end of buffer

        unit->items[i] = items[i];
    }
}

int GetUnitItemCount(struct Unit* unit) {
    int i;

    for (i = (UNIT_ITEM_COUNT - 1); i >= 0; --i)
        if (unit->items[i])
            return i + 1;

    return 0;
}

s8 UnitHasItem(struct Unit* unit, int item) {
    int i;

    item = GetItemIndex(item);

    for (i = 0; (i < UNIT_ITEM_COUNT) && unit->items[i]; ++i)
        if (GetItemIndex(unit->items[i]) == item)
            return TRUE;

    return FALSE;
}

int LoadUnits(const struct UnitDefinition* uDef) {
    int count = 0;

    while (uDef->charIndex) {
        LoadUnit(uDef);

        uDef++;
        count++;
    }

    return count;
}

void HalveUnitCombatStats(struct Unit* unit) { // unused
    if (unit->pow >= 4)
        unit->pow /= 2;

    if (unit->def >= 4)
        unit->def /= 2;

    if (unit->res >= 4)
        unit->res /= 2;
}
