#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

//! FE8U = 0x08040668
s8 GetAiWarpDestinationNearThreatenedAlly(struct Vec2* out) {
    int ix;
    int iy;

    u8 best = 0xff;
    u8 tmpRangeA = 0xff;
    u8 tmpRangeB = 0xff;

    int xDecision = 0;
    int yDecision = 0;

    const s8* cost = GetUnitMovementCost(gActiveUnit);

    int faction = GetCurrentPhase();
    int i;

    for (i = faction + 1; i < faction + 0x80; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
            continue;
        }

        GenerateUnitMovementMapOnRange(unit);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                    continue;
                }

                if (gBmMapUnit[iy][ix] != 0) {
                    if (AreUnitsAllied(unit->index, gBmMapUnit[iy][ix]) != 0) {
                        continue;
                    }

                    if (tmpRangeA > gMapRangeSigned[iy][ix]) {
                        tmpRangeA = gBmMapRange[iy][ix];
                    }
                } else {
                    if (cost[gBmMapTerrain[iy][ix]] <= 0) {
                        continue;
                    }

                    if (gMapMovementSigned[iy][ix] <= MAP_MOVEMENT_MAX) {
                        continue;
                    }

                    if (tmpRangeB > gMapRangeSigned[iy][ix]) {
                        xDecision = ix;
                        yDecision = iy;
                        tmpRangeB = gBmMapRange[iy][ix];
                    }
                }
            }
        }

        if (tmpRangeA == 0xff) {
            continue;
        }

        if (best < tmpRangeA) {
            continue;
        }

        if (tmpRangeB == 0xff) {
            continue;
        }

        out->x = xDecision;
        out->y = yDecision;
        best = tmpRangeA;

    }

    if (best != 0xff) {
        return 1;
    }

    return 0;
}
