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

void UnitApplyWorkingMovementScript(struct Unit* unit, int x, int y)
{
    u8* it = gWorkingMovementScript;

    for (;;) {
        gActionData.xMove = x;
        gActionData.yMove = y;

        switch (*it)
        {

        case MOVE_CMD_MOVE_UP: // up
            y--;
            break;

        case MOVE_CMD_MOVE_DOWN: // down
            y++;
            break;

        case MOVE_CMD_MOVE_LEFT: // left
            x--;
            break;

        case MOVE_CMD_MOVE_RIGHT: // right
            x++;
            break;

        } // switch (*it)

        if (!(UNIT_CATTRIBUTES(unit) & (CA_THIEF | CA_FLYER | CA_ASSASSIN)))
        {
            if (gBmMapHidden[y][x] & HIDDEN_BIT_TRAP)
            {
                *++it = MOVE_CMD_HALT;

                gActionData.unitActionType = UNIT_ACTION_TRAPPED;
                gActionData.xMove = x;
                gActionData.yMove = y;

                return;
            }
        }

        if (gBmMapHidden[y][x] & HIDDEN_BIT_UNIT)
        {
            *it++ = MOVE_CMD_BUMP;
            *it++ = MOVE_CMD_HALT;

            gActionData.unitActionType = UNIT_ACTION_TRAPPED;

            return;
        }

        if (*it == MOVE_CMD_HALT)
            break;

        it++;
    }
}
