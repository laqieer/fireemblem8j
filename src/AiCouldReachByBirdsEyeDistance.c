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

//! FE8U = 0x0803AC90
s8 AiCouldReachByBirdsEyeDistance(struct Unit* unit, struct Unit* other, u16 item) {

    int distance = RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos);

    if (distance <= UNIT_MOV(unit) + UNIT_MOV(other) + GetItemMaxRange(item)) {
        return 1;
    }

    return 0;
}
