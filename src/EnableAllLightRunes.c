#include "global.h"
#include "constants/terrains.h"
#include "bmmap.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[];

void EnableAllLightRunes(void)
{
    struct Trap* trap;

    for (trap = sTrapPool; trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_NONE;
            break;

        } // switch (trap->type)
    }
}
