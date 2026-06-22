#include "global.h"

#include "bmunit.h"
#include "bmmap.h"

extern struct Vec2 CONST_DATA sRange3OffsetLut[];

//! FE8U = 0x0803B390
int AiCountNearbyUnits(s16 x, s16 y) {
    int lx = x;
    int ly = y;

    int count = 0;

    struct Vec2* it = sRange3OffsetLut;

    it--;

    while (it->x != 9999) {
        it++;

        if (lx + it->x >= gBmMapSize.x) {
            continue;
        }

        if (ly + it->y >= gBmMapSize.y) {
            continue;
        }

        if (gBmMapUnit[ly + it->y][lx + it->x] == 0) {
            continue;
        }

        count++;
    }

    return count;
}
