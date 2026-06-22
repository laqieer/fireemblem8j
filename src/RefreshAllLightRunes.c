#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[];

extern inline struct Trap* GetTrap(int id)
{
    return sTrapPool + id;
}

//! FE8U = 0x0802E3A8
void RefreshAllLightRunes(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_LIGHT_RUNE:
            gBmMapTerrain[trap->yPos][trap->xPos] = TERRAIN_NONE;
            break;

        }
    }
}
