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

//! FE8U = 0x0803ED28
s8 AiTryDoDanceAdjacent(int x, int y) {
    int ix;
    int iy;

    u8 level = 0;
    u8 target = 0;

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & (CA_DANCE | CA_PLAY))) {
        return 0;
    }

    BmMapFill(gBmMapMovement, -1);

    MapAddInRange(x, y, 1, 1);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (!AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (UNIT_CATTRIBUTES(unit) & (CA_DANCE | CA_PLAY)) {
                continue;
            }

            if (level < unit->level) {
                level = unit->level;
                target = gBmMapUnit[iy][ix];
            }
        }
    }

    if (level != 0) {
        AiSetDecision(x, y, AI_ACTION_REFRESH, target, 0, 0, 0);
        return 1;
    }

    return 0;
}
