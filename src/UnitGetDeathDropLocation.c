#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"

extern inline struct Unit* GetUnit(int id) {
    return gUnitLookup[id & 0xFF];
}

inline struct Unit* GetUnit(int id);

extern inline s8 CanUnitCrossTerrain(struct Unit* unit, int terrain) {
    const s8* lookup = GetUnitMovementCost(unit);
    return (lookup[terrain] > 0) ? TRUE : FALSE;
}

inline s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);

void UnitGetDeathDropLocation(struct Unit* unit, int* xOut, int* yOut) {
    int iy, ix, minDistance = 9999;
    struct Unit* rescuee = GetUnit(unit->rescue);

    // Fill the movement map
    GenerateExtendedMovementMap(unit->xPos, unit->yPos, TerrainTable_MovCost_FlyNormal);

    // Put the active unit on the unit map (kinda, just marking its spot)
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0xFF;

    // Remove the actor unit from the unit map (why?)
    gBmMapUnit[unit->yPos][unit->xPos] = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy) {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix) {
            int distance;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if (gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
                continue;

            if (!CanUnitCrossTerrain(rescuee, gBmMapTerrain[iy][ix]))
                continue;

            distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (minDistance >= distance) {
                minDistance = distance;

                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    // Remove the active unit from the unit map again
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
}
