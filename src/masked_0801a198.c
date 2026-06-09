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

 void RevertMovementScript(u8* begin, u8* end);

void SetWorkingMoveCosts(const s8 mct[TERRAIN_COUNT])
{
    int i;

    for (i = 0; i < TERRAIN_COUNT; ++i)
        gWorkingTerrainMoveCosts[i] = mct[i];
}
