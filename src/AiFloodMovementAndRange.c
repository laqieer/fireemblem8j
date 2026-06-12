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

//! FE8U = 0x0803D8D4
void AiFloodMovementAndRange(struct Unit* unit, u16 move, u16 item) {
    int ix;
    int iy;

    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, move, unit->index);

    BmMapFill(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }

    return;
}
