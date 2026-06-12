#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"

//! FE8U = 0x0803EC18
void AiMarkStaffCapabilityFlags(u16 item) {
    switch (GetItemIndex(item)) {
        case ITEM_STAFF_HEAL:
        case ITEM_STAFF_MEND:
        case ITEM_STAFF_RECOVER:
        case ITEM_STAFF_PHYSIC:
        case ITEM_STAFF_FORTIFY:
            gActiveUnit->aiFlags |= AI_UNIT_FLAG_2;
            break;

        case ITEM_STAFF_REPAIR:
            gActiveUnit->aiFlags |= AI_UNIT_FLAG_4;
            break;
    }

    return;
}
