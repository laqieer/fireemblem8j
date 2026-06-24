#include "global.h"

#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"

//! FE8U = 0x0803AA40
s8 AiFindTargetInReachNeglectWallByFunc(s8(*func)(struct Unit* unit), struct Vec2* out) {
    s16 ix;
    s16 iy;
    u8 bestDistance = 0xff;
    s16 xOut = 0;
    s16 yOut = 0;
    GenerateExtendedMovementMapOnRangeNeglectWall(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));
    xOut = -1;
    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) continue;
            if (gBmMapUnit[iy][ix] == 0) continue;
            if (gBmMapUnit[iy][ix] == gActiveUnitId) continue;
            if (func(GetUnit(gBmMapUnit[iy][ix])) == 0) continue;
            if (gBmMapRange[iy][ix] > bestDistance) continue;
            bestDistance = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }
    if (xOut >= 0) {
        out->x = xOut;
        out->y = yOut;
        return 1;
    }
    return 0;
}
