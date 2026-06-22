#include "global.h"

#include "bm.h"
#include "bmmap.h"
#include "bmphase.h"

extern struct Vec2 CONST_DATA sRange3OffsetLut[];

int AiCountNearbyAlliedUnits(s16 x, s16 y) {
    int xi = x;
    int yi = y;
    int count = 0;

    struct Vec2* it = sRange3OffsetLut;

    it--;

    while (it->x != 9999) {
        it++;

        if (xi + it->x >= gBmMapSize.x) {
            continue;
        }

        if (yi + it->y >= gBmMapSize.y) {
            continue;
        }

        if (gBmMapUnit[yi + it->y][xi + it->x] == 0) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[yi + it->y][xi + it->x]) != 1) {
            continue;
        }

        count++;
    }

    return count;
}
