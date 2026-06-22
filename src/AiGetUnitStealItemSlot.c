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

s8 AiGetUnitStealItemSlot(struct Unit* unit) {
    int i;

    u8 rank = 0xff;
    int slot = -1;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u8 rankNew;

        u16 item = unit->items[i];

        if (item == 0) {
            return slot;
        }

        rankNew = AiGetItemStealRank(ITEM_INDEX(item));

        if (rank < rankNew) {
            continue;
        }

        rank = rankNew;
        slot = (s8)i;
    }

    return slot;
}
