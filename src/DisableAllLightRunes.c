#include "global.h"
#include "constants/terrains.h"
#include "bmmap.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[];

void DisableAllLightRunes(void)
{
    struct Trap* trap;

    for (trap = sTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
            break;

        } // switch (trap->type)
    }
}
