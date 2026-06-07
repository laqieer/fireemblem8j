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

void MarkMovementMapEdges(void) {
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gMapMovementSigned[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if (gMapMovementSigned[iy][ix - 1] < 0 && (ix != 0))
                gBmMapMovement[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gBmMapMovement[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy - 1][ix] < 0 && (iy != 0))
                gBmMapMovement[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if (gMapMovementSigned[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gBmMapMovement[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
}

void MarkWorkingMapEdges(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gWorkingBmMap[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gWorkingBmMap[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if ((s8) gWorkingBmMap[iy][ix - 1] < 0 && (ix != 0))
                gWorkingBmMap[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gWorkingBmMap[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy - 1][ix] < 0 && (iy != 0))
                gWorkingBmMap[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gWorkingBmMap[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
}

void MapAddInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] += value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] += value;
        }
    }
}

void MapSetInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] = value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingBmMap[iy][ix] = value;
        }
    }
}
