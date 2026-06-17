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

s8 AiFindClosestUnlockPosition(int flags, struct Vec2* outA, struct Vec2* outB) {
    int ix;
    int iy;
    struct Vec2 tmp;
    u16 zero = 0;

    u8 bestDistance = 0xFF;
    u8 count = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            switch (gBmMapTerrain[iy][ix]) {
                case TERRAIN_DOOR:
                    count++;

                    if (flags & AI_FLAG_3) {
                        continue;
                    }

                    if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiGetPositionRange, &tmp)) {
                        continue;
                    }

                    break;

                case TERRAIN_CHEST_FULL:
                    count++;

                    if (flags & AI_FLAG_BERSERKED) {
                        continue;
                    }

                    tmp.x = ix;
                    tmp.y = iy;

                    if (gBmMapMovement[iy][ix] <= UNIT_MOV(gActiveUnit)) {
                        if (flags & AI_FLAG_0) {
                            if (gBmMapUnit[tmp.y][tmp.x] != 0 && !AreUnitsAllied(gActiveUnit->index, gBmMapUnit[tmp.y][tmp.x])) {
                                continue;
                            }
                        }

                        if (flags & AI_FLAG_STAY) {
                            if (AiCountNearbyEnemyUnits(tmp.x, tmp.y) != 0) {
                                continue;
                            }
                        }

                        outA->x = tmp.x;
                        outA->y = tmp.y;

                        if (outB != 0) {
                            outB->x = ix;
                            outB->y = iy;
                        }

                        return 1;
                    }

                    break;

                default:
                    continue;
            }

            if (flags & 1) {
                if (gBmMapUnit[tmp.y][tmp.x] != 0 && !AreUnitsAllied(gActiveUnit->index, gBmMapUnit[tmp.y][tmp.x])) {
                    continue;
                }
            }

            if (flags & 2) {
                if (AiCountNearbyEnemyUnits(tmp.x, tmp.y) != 0) {
                    continue;
                }
            }

            if (bestDistance <= gMapRangeSigned[tmp.y][tmp.x]) {
                continue;
            }

            outA->x = tmp.x;
            outA->y = tmp.y;
            bestDistance = gBmMapRange[tmp.y][tmp.x];

            if (outB != 0) {
                outB->x = ix;
                outB->y = iy;
            }
        }
    }

    if (!(zero & 0x10000)) // if (1)
        gAiState.cmd_result[1] = 1;

    if (count == 0) {
        gAiState.cmd_result[0] = 5;
    }

    if (bestDistance != 0xff) {
        return 1;
    }

    return 0;
}
