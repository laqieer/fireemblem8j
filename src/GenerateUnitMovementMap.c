#include "global.h"
#include "bmidoten.h"
#include "bmunit.h"
#include "bmmap.h"

extern u8 ** gWorkingBmMap;

extern inline void SetWorkingBmMap(u8 ** map)
{
    gWorkingBmMap = map;
}

void GenerateUnitMovementMap(struct Unit* unit)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}
