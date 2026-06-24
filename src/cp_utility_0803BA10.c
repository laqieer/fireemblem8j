#include "global.h"

#include "cp_common.h"

#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"

#include "cp_utility.h"

//! FE8U = 0x0803BA08
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, s8 unk)
{
    s16 ix;
    s16 iy;

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(x, y, action, 0, 0, 0, 0);
        return;
    }

    if (unk)
    {
        GenerateExtendedMovementMapOnRange(x, y, GetUnitMovementCost(gActiveUnit));
    }
    else
    {
        GenerateUnitExtendedMovementMapOnRangeAt(x, y, gActiveUnit);
    }

    GenerateUnitMovementMap(gActiveUnit);

    bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
            {
                continue;
            }

            if (maxDanger == 0)
            {
                if (UNIT_MOV(gActiveUnit) < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
                {
                    continue;
                }
            }

            if (!AiCheckDangerAt(ix, iy, maxDanger))
            {
                continue;
            }

            if (gBmMapRange[iy][ix] > bestRange)
            {
                continue;
            }

            bestRange = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
    {
        AiSetDecision(xOut, yOut, action, AI_ACTION_NONE, 0, 0, 0);
    }

    return;
}
