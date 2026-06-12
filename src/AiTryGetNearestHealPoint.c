#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"
/* TU-private data externs bound at their JP addresses */
extern u8 sTerrainList_Fort[];

//! FE8U = 0x0803E470
s8 AiTryGetNearestHealPoint(struct Vec2* out) {
    struct Unit* unit;

    int ix;
    int iy;

    int currentCount = 10000;
    int currentMove = 0xff;

    if (gActiveUnit->ai_config & AI_UNIT_CONFIG_FLAG_STAY) {
        return 0;
    }

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_LORD) {
        return 0;
    }

    GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            int count;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (!AiIsInByteList(sTerrainList_Fort, gBmMapTerrain[iy][ix])) {
                if ((gBmMapUnit[iy][ix] == 0) || !AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                    continue;
                }

                unit = GetUnit(gBmMapUnit[iy][ix]);

                if (!(unit->aiFlags & AI_UNIT_FLAG_2)) {
                    continue;
                }
            } else {
                if (gBmMapUnit[iy][ix] != 0) {
                    if (!AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                        continue;
                    }

                    unit = GetUnit(gBmMapUnit[iy][ix]);

                    if (unit->ai_config & AI_UNIT_CONFIG_FLAG_STAY) {
                        if (!(unit->aiFlags & AI_UNIT_FLAG_2)) {
                            continue;
                        }
                    }
                }
            }

            count = AiCountNearbyEnemyUnits(ix, iy);

            if ((count <= currentCount) && (gMapMovementSigned[iy][ix] <= currentMove)) {
                currentCount = count;
                currentMove = gBmMapMovement[iy][ix];
                out->x = ix;
                out->y = iy;
            }
        }
    }

    if (currentMove != 0xff) {
        if ((gBmMapUnit[out->y][out->x] != 0) && (gBmMapUnit[out->y][out->x] != gActiveUnitId)) {
            unit = GetUnit(gBmMapUnit[out->y][out->x]);
            unit->aiFlags |= AI_UNIT_FLAG_1;
        }

        return 1;
    }

    return 0;
}
