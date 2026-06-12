#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"

//! FE8U = 0x0803D124
s8 AiFindClosestReachableTerrainPosition(const u8* terrainList, u32 flags, struct Vec2* out) {
    int ix;
    int iy;

    u8 best = 0xff;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapRange[iy][ix] > 0x78) {
                continue;
            }

            if (AiIsInByteList(terrainList, gBmMapTerrain[iy][ix]) == 0) {
                continue;
            }

            if (flags & 1) {
                if (gBmMapUnit[iy][ix] != 0 && !AreUnitsAllied(gActiveUnit->index, gBmMapUnit[iy][ix])) {
                    continue;
                }
            }

            if (flags & 2) {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0) {
                    continue;
                }
            }

            if (best <= gMapRangeSigned[iy][ix]) {
                continue;
            }

            out->x = ix;
            out->y = iy;
            best = gBmMapRange[iy][ix];
        }
    }

    if (best != 0xff) {
        return 1;
    }

    return 0;
}
