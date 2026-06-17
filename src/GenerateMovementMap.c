#include "global.h"
#include "constants/terrains.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmunit.h"
#include "mu.h"
#include "proc.h"
#include "rng.h"
#include "bmarch.h"
#include "bmmind.h"
#include "bmidoten.h"




void GenerateMovementMap(int x, int y, int movement, int unitId)
{
    gMovMapFillState.dst = gMovMapFillStPool1;
    gMovMapFillState.src = gMovMapFillStPool2;

    gMovMapFillState.movement = movement;

    if (unitId == 0)
    {
        gMovMapFillState.hasUnit = FALSE;
    }
    else
    {
        gMovMapFillState.hasUnit = TRUE;
        gMovMapFillState.unitId = unitId;
    }

    gMovMapFillState.maxMovementValue = MAP_MOVEMENT_MAX;

    BmMapFill(gWorkingBmMap, -1);

    gMovMapFillState.dst->xPos = x;
    gMovMapFillState.dst->yPos = y;
    gMovMapFillState.dst->connexion = 5;
    gMovMapFillState.dst->leastMoveCost = 0;

    gWorkingBmMap[y][x] = 0;

    gMovMapFillState.dst++;
    gMovMapFillState.dst->connexion = 4;

    CallARM_FillMovementMap();
}
