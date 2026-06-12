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

//! FE8U = 0x0803C1B4
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit* unit) {
    int ix;
    int iy;

    int count = 0;

    BmMapFill(gBmMapMovement, 0);
    MapAddInBoundedRange(unit->xPos, unit->yPos, 1, 8);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gMapMovementSigned[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (!AreUnitsAllied(unit->index, gBmMapUnit[iy][ix])) {
                continue;
            }

            count++;
        }
    }

    unit->ai_counter = count;

    return;
}
