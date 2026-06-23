#include "global.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "constants/terrains.h"
#include "cp_utility.h"

s8 AiGetUnitClosestValidPosition(struct Unit* unit, s16 x, s16 y, struct Vec2* out) {
    s16 ix;
    s16 iy;
    u8 bestRange;

    if ((gBmMapUnit[y][x] | gBmMapOther[y][x] | gBmMapHidden[y][x]) == 0) {
        out->x = x;
        out->y = y;

        return 1;
    }

    GenerateExtendedMovementMapOnRange(x, y, GetUnitMovementCost(unit));
    GenerateUnitExtendedMovementMap(unit);

    bestRange = 124;
    out->x = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if ((gBmMapUnit[iy][ix] | gBmMapOther[iy][ix] | gBmMapHidden[iy][ix]) != 0) {
                continue;
            }

            if (gBmMapRange[iy][ix] > bestRange) {
                continue;
            }

            bestRange = gBmMapRange[iy][ix];
            out->x = ix;
            out->y = iy;
        }
    }

    if (out->x != -1) {
        return 1;
    }

    return 0;
}
