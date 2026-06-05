#include "global.h"

#include "constants/terrains.h"
#include "constants/event-flags.h"

#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "uiselecttarget.h"
#include "bmtarget.h"
#include "bmudisp.h"
#include "bmusailment.h"
#include "bmtrick.h"



static void GenerateFireTileTrapTargets(int x, int y, int damage);
static void GenerateArrowTrapTargets(int x, int y, int damage);
static void GenerateGasTrapTargets(int x, int y, int damage, int facing);
static s8 ShouldSkipGasTrapDisplay(int x, int y, int facing);




void UnitHideIfUnderRoof(struct Unit* unit)
{
    if (gBmMapTerrain[unit->yPos][unit->xPos] == TERRAIN_ROOF)
    {
        unit->state |= (US_HIDDEN | US_UNDER_A_ROOF);
    }
}

void UpdateRoofedUnits(void)
{
    int i;

    for (i = 1; i < 0xC0; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & US_UNDER_A_ROOF))
            continue;

        if (gBmMapTerrain[unit->yPos][unit->xPos] != TERRAIN_ROOF)
        {
            unit->state = (unit->state &~ (US_UNDER_A_ROOF | US_HIDDEN)) | US_BIT8;
        }
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
}

void GenerateFireTileTrapTargets(int x, int y, int damage)
{
    AddTarget(x, y, gBmMapUnit[y][x], damage);
}

void GenerateArrowTrapTargets(int x, int y, int damage)
{
    int iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
    {
        if (gBmMapUnit[iy][x])
            AddTarget(x, iy, gBmMapUnit[iy][x], damage);
    }
}

void GenerateGasTrapTargets(int x, int y, int damage, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 2; i >= 0; --i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            AddTarget(x, y, gBmMapUnit[y][x], damage);
    }
}

s8 ShouldSkipGasTrapDisplay(int x, int y, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    s8 boolHasNoEffect = TRUE;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 0; i < 3; ++i)
    {
        x += xInc;
        y += yInc;

        if (gBmMapUnit[y][x])
            boolHasNoEffect = FALSE;
    }

    return boolHasNoEffect;
}
