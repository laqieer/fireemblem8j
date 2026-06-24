#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "bmtrick.h"

#include "muctrl.h"

//! FE8U = 0x0807A644
u8 * MuCtr_GenMoveScript(struct Unit * unit, struct Vec2 * pos, s8 flag)
{
    s8 terrainFlag;

    s8 x = pos->x;
    s8 y = pos->y;

    if (flag == 0)
    {
        GenerateExtendedMovementMapOnRange(unit->xPos, unit->yPos, unit->pClassData->pMovCostTable[0]);
        GenerateBestMovementScript(x, y, gWorkingMovementScript);
    }
    else
    {
        DisableAllLightRunes();

        if (gBmMapTerrain[y][x] == 0)
        {
            gBmMapTerrain[y][x] = 1;
            terrainFlag = 1;
        }
        else
        {
            AiGetUnitClosestValidPosition(unit, x, y, pos);
            x = pos->x;
            y = pos->y;
            terrainFlag = 0;
        }

        GenerateExtendedMovementMapOnRange(unit->xPos, unit->yPos, unit->pClassData->pMovCostTable[0]);
        GenerateBestMovementScript(x, y, gWorkingMovementScript);

        if (terrainFlag == 1)
        {
            gBmMapTerrain[y][x] = 0;
        }

        EnableAllLightRunes();
    }

    return gWorkingMovementScript;
}
