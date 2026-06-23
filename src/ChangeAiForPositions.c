#include "global.h"
#include "bmunit.h"
#include "functions.h"

void ChangeAiForPositions(struct Vec2 * posArray, u8 length, u8 ai1, u8 ai2, u8 unused)
{
    int i;
    s16 j;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;
        for (j = 0; j < length; j++)
        {
            if (unit->xPos != posArray[j].x)
                continue;
            if (unit->yPos != posArray[j].y)
                continue;
            ChangeUnitAi(unit, ai1, ai2, unused);
        }
    }

    return;
}
