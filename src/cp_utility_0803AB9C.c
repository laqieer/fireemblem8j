#include "global.h"

#include "cp_common.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"

//! FE8U = 0x0803AB5C
void AiRandomMove(void) {
    s16 ix;
    s16 iy;
    u8 lastRand = 0;
    s16 xOut = 0;
    s16 yOut = 0;
    GenerateUnitMovementMap(gActiveUnit);
    xOut = -1;
    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u8 rand;
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) continue;
            if (gBmMapUnit[iy][ix] != 0) continue;
            rand = NextRN_N(0x100);
            if (rand < lastRand) continue;
            lastRand = rand;
            xOut = ix;
            yOut = iy;
        }
    }
    if (xOut >= 0) {
        AiSetDecision(xOut, yOut, AI_ACTION_NONE, 0, 0, 0, 0);
    }
    return;
}
