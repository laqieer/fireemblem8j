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

//! FE8U = 0x0803B994
s8 AiGetChestUnlockItemSlot(u8* out) {
    int i;

    *out = 0;

    if (GetUnitItemCount(gActiveUnit) == UNIT_ITEM_COUNT) {
        gActiveUnit->aiFlags |= AI_UNIT_FLAG_3;
        return 0;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            return 0;
        }

        *out = i;

        if (GetItemIndex(item) == ITEM_CHESTKEY) {
            return 1;
        }

        if (GetItemIndex(item) == ITEM_LOCKPICK) {
            if (UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL) {
                return 1;
            }
        }
    }

    return 0;
}
