#include "global.h"

#include "cp_common.h"

#include "bmunit.h"
#include "bmmap.h"
#include "bmarch.h"

#include "cp_utility.h"

//! FE8U = 0x0803F82C
s8 AiBallistaRideExit(const void * input)
{
    int ix;
    int iy;

    s16 x = -1;
    s16 y = -1;

    s16 unk = 0;
    u8 movement = 0xff;

    if (gActiveUnit->state & US_IN_BALLISTA)
    {
        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) == 0)
        {
            AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, AI_ACTION_EXITBALLISTA, 0, 0, 0, 0);
        }

        return 1;
    }

    InitAiMoveMapForUnit(gActiveUnit);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (GetRiddenBallistaAt(ix, iy) == 0)
            {
                continue;
            }

            /* fe8u writes the equivalent `(unk + (unk + 128 / 48)) / 2`; JP
             * codegen renders the increment as a plain `unk + 1` (s16-held). */
            unk = unk + 1;

            if (gBmMapUnit[iy][ix] != 0)
            {
                continue;
            }

            if (gBmMapMovement[iy][ix] <= movement)
            {
                movement = gBmMapMovement[iy][ix];

                x = ix;
                y = iy;
            }
        }
    }

    if (x >= 0)
    {
        AiTryMoveTowards(x, y, 0, 0xff, 1);
    }

    if (gAiDecision.actionPerformed == 1)
    {
        if ((gAiDecision.xMove == x) && (gAiDecision.yMove == y))
        {
            AiUpdateDecision(AI_ACTION_RIDEBALLISTA, 0, 0, 0, 0);
        }
    }
    else
    {
        if (unk != 0)
        {
            gAiState.cmd_result[0] = 7;
        }
        else
        {
            gAiState.cmd_result[0] = 6;
        }
    }

    return 1;
}
