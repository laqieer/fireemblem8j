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

void GenerateMovementMapOnWorkingMap(struct Unit* unit, int x, int y, int movement)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    GenerateMovementMap(x, y, movement, unit->index);
}
