#include "global.h"

#include "bmmap.h"
#include "bmidoten.h"

void MapFloodCoreStepThumb(int connexion, int x, int y)
{
    int tileMovementCost;

    x += gMovMapFillState.src->xPos;
    y += gMovMapFillState.src->yPos;

    tileMovementCost = gWorkingTerrainMoveCosts[gBmMapTerrain[y][x]]
        + (s8) gWorkingBmMap[(u8) gMovMapFillState.src->yPos][(u8) gMovMapFillState.src->xPos];

    if (tileMovementCost >= gWorkingBmMap[y][x])
        return;

    if (gMovMapFillState.hasUnit && gBmMapUnit[y][x])
        if ((gBmMapUnit[y][x] ^ gMovMapFillState.unitId) & 0x80)
            return;

    if (tileMovementCost > gMovMapFillState.movement)
        return;

    gMovMapFillState.dst->xPos = x;
    gMovMapFillState.dst->yPos = y;
    gMovMapFillState.dst->connexion = connexion;
    gMovMapFillState.dst->leastMoveCost = tileMovementCost;

    gMovMapFillState.dst++;

    gWorkingBmMap[y][x] = tileMovementCost;
}
