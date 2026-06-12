#include "global.h"
#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"
#include "constants/items.h"

//! FE8U = 0x0803D880
void AiFillReversedAttackRangeMap(struct Unit* unit, u16 item) {
    BmMapFill(gBmMapRange, 0);
    MapAddInBoundedRange(unit->xPos, unit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    return;
}
