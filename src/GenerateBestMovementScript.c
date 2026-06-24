#include "global.h"

#include "constants/terrains.h"

#include "bmitem.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmunit.h"
#include "mu.h"
#include "proc.h"
#include "rng.h"
#include "bmidoten.h"

void RevertMovementScript(u8* begin, u8* end);

void GenerateBestMovementScript(int x, int y, u8 output[])
{
    u8* outputStart = output;

    short bestCost;
    short bestDirectionCount;

    u8 neighbourCosts[4];
    u8 bestDirections[4];

    short nextDirection = 0;

    int i;

    while (((s8**) gWorkingBmMap)[y][x] != 0)
    {
        if (x == (gBmMapSize.x - 1))
            neighbourCosts[MOVE_CMD_MOVE_LEFT] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_LEFT] = gWorkingBmMap[y][x+1];

        if (x == 0)
            neighbourCosts[MOVE_CMD_MOVE_RIGHT] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_RIGHT] = gWorkingBmMap[y][x-1];

        if (y == (gBmMapSize.y - 1))
            neighbourCosts[MOVE_CMD_MOVE_UP] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_UP] = gWorkingBmMap[y+1][x];

        if (y == 0)
            neighbourCosts[MOVE_CMD_MOVE_DOWN] |= 0xFF;
        else
            neighbourCosts[MOVE_CMD_MOVE_DOWN] = gWorkingBmMap[y-1][x];

        bestCost = 0x100;
        bestDirectionCount = 0;

        for (i = 0; i < 4; ++i)
            if (bestCost > neighbourCosts[i])
                bestCost = neighbourCosts[i];

        for (i = 0; i < 4; ++i)
            if (bestCost == neighbourCosts[i])
                bestDirections[bestDirectionCount++] = i;

        switch (bestDirectionCount)
        {

        case 1:
            nextDirection = bestDirections[0];
            break;

        case 2:
            nextDirection = bestDirections[NextRN_N(2)];
            break;

        case 3:
            nextDirection = bestDirections[NextRN_N(3)];
            break;

        case 4:
            nextDirection = bestDirections[NextRN_N(4)];
            break;

        } // switch (bestDirectionCount)

        *output++ = nextDirection;

        switch (nextDirection)
        {

        case MOVE_CMD_MOVE_LEFT:
            x++;
            break;

        case MOVE_CMD_MOVE_RIGHT:
            x--;
            break;

        case MOVE_CMD_MOVE_UP:
            y++;
            break;

        case MOVE_CMD_MOVE_DOWN:
            y--;
            break;

        } // switch (nextDirection)
    }

    RevertMovementScript(outputStart, output);
}
