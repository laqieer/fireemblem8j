#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "cp_utility.h"

//! FE8U = 0x0803C44C
s8 AiCanUnitUseAnyStaff(struct Unit* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = unit->items[i];

        if (item == 0) {
            return 0;
        }

        if (GetItemAttributes(item) & (IA_STAFF | IA_MAGIC)) {
            if (CanUnitUseStaff(unit, item)) {
                return 1;
            }
        }
    }

    return 0;
}
