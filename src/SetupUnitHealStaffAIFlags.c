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

//! FE8U = 0x0803C168
void SetupUnitHealStaffAIFlags(struct Unit* unit, u16 item) {

    int flags = 0;

    if ((GetItemAttributes(item) & IA_WEAPON) && (GetItemMaxRange(item) > 1)) {
        flags = AI_UNIT_FLAG_6;
    }

    switch (GetItemUseEffect(item)) {
        case 0x01:
        case 0x02:
        case 0x03:
        case 0x04:
        case 0x05:
        case 0x21:
        case 0x22:
            flags |= AI_UNIT_FLAG_2;
            break;
    }

    unit->aiFlags |= flags;

    return;
}
