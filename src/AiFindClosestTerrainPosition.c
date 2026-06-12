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

//! FE8U = 0x0803AD38
s8 AiFindClosestTerrainPosition(const u8* terrainList, int flags, struct Vec2* out) {
    int ix;
    int iy;

    u8 bestDistance = 0xff;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]) == 0) {
                continue;
            }

            if (flags & AI_FLAG_0) {
                if ((gBmMapUnit[iy][ix] != 0) && (AreUnitsAllied(gActiveUnit->index, gBmMapUnit[iy][ix]) == 0)) {
                    continue;
                }
            }

            if (flags & AI_FLAG_STAY) {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0) {
                    continue;
                }
            }

            if (bestDistance <= gMapRangeSigned[iy][ix]) {
                continue;
            }

            out->x = ix;
            out->y = iy;

            bestDistance = gBmMapRange[iy][ix];
        }
    }

    if (bestDistance != 0xFF) {
        return 1;
    }

    return 0;
}
