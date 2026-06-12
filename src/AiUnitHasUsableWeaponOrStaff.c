#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x080402A8
s8 AiUnitHasUsableWeaponOrStaff(struct Unit* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = unit->items[i];

        if (item == 0) {
            return 0;
        }

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF | IA_LOCK_3))) {
            continue;
        }

        if (CanUnitUseWeapon(unit, item) || CanUnitUseStaff(unit, item)) {
            return 1;
        }

    }

    return 0;
}
