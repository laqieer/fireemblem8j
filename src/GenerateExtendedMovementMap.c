#include "global.h"
#include "constants/terrains.h"
#include "bmmap.h"
#include "bmidoten.h"

extern inline void SetWorkingBmMap(u8 ** map)
{
    gWorkingBmMap = map;
}

void GenerateExtendedMovementMap(int x, int y, const s8 mct[TERRAIN_COUNT])
{
    SetWorkingMoveCosts(mct);
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, 0);
}
