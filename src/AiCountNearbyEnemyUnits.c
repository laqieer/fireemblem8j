#include "global.h"

#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"

#include "cp_utility.h"

extern struct Vec2 CONST_DATA sRange3OffsetLut[];

//! FE8U = 0x0803B434
int AiCountNearbyEnemyUnits(s16 xParam, s16 yParam) {
    int x = xParam;
    int y = yParam;
    int count = 0;

    struct Vec2* it = sRange3OffsetLut;

    it--;

    while (it->x != 9999) {
        it++;

        if (x + it->x >= gBmMapSize.x) {
            continue;
        }

        if (y + it->y >= gBmMapSize.y) {
            continue;
        }

        if (gBmMapUnit[y + it->y][x + it->x] == 0) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[y + it->y][x + it->x])) {
            continue;
        }

        count++;
    }

    return count;
}
