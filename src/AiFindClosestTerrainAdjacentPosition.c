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

u8 AiGetPositionRange(int x, int y);


//! FE8U = 0x0803AE94
s8 AiFindClosestTerrainAdjacentPosition(const u8* terrainList, int flags, struct Vec2* out) {
    int ix;
    int iy;
    struct Vec2 tmp;

    u8 bestDistance = 0xff;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (!AiIsInByteList(terrainList, gBmMapTerrain[iy][ix])) {
                continue;
            }

            if (flags & AI_FLAG_0) {
                if (gBmMapUnit[iy][ix] != 0 && !AreUnitsAllied(gActiveUnit->index, gBmMapUnit[iy][ix])) {
                    continue;
                }
            }

            if (flags & AI_FLAG_STAY) {
                if (AiCountNearbyEnemyUnits(ix, iy) != 0) {
                    continue;
                }
            }

            if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiGetPositionRange, &tmp)) {
                continue;
            }

            if (bestDistance <= (s8)gBmMapRange[tmp.y][tmp.x]) {
                continue;
            }

            out->x = tmp.x;
            out->y = tmp.y;
            bestDistance = gBmMapRange[tmp.y][tmp.x];
        }
    }

    if (bestDistance != 0xFF) {
        return 1;
    }

    return 0;
}
