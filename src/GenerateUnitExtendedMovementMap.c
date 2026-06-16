#include "global.h"
#include "bmidoten.h"
#include "bmunit.h"
#include "bmmap.h"

extern u8 ** gWorkingBmMap;

extern inline void SetWorkingBmMap(u8 ** map)
{
    gWorkingBmMap = map;
}

void GenerateUnitExtendedMovementMap(struct Unit* unit)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}
