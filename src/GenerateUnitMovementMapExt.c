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

extern inline void SetWorkingBmMap(u8** map)
{
    gWorkingBmMap = map;
}

void GenerateUnitMovementMapExt(struct Unit* unit, s8 movement)
{
    int move = movement;

    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, move, unit->index);
}
