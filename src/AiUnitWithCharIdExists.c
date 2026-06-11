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

//! FE8U = 0x0803BF84
s8 AiUnitWithCharIdExists(u16 uid) {
    int i;

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->pCharacterData->number != uid) {
            continue;
        }

        if (unit->state & US_RESCUED) {
            return 1;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            return 0;
        }

        return 1;
    }

    return 0;
}
