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

void GenerateMagicSealMap(int value)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
            MapSetInRange(unit->xPos, unit->yPos, 10, value);
    }
}
