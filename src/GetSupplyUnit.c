#include "global.h"
#include "constants/chapters.h"
#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"
#include "bmcontainer.h"

struct Unit * GetSupplyUnit()
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
            return unit;
    }
    return NULL;
}
