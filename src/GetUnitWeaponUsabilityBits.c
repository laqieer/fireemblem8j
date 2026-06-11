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

int GetUnitWeaponUsabilityBits(struct Unit* unit) {
    int i, item, result = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i) {
        if ((GetItemAttributes(item) & IA_WEAPON) && CanUnitUseWeapon(unit, item))
            result |= UNIT_USEBIT_WEAPON;

        if ((GetItemAttributes(item) & IA_STAFF) && CanUnitUseStaff(unit, item))
            result |= UNIT_USEBIT_STAFF;
    }

    return result;
}
