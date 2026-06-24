#include "global.h"
#include "bmunit.h"
#include "constants/characters.h"

void HandleCh5xUnits_End(void)
{
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        switch (unit->pCharacterData->number) {
            case CHARACTER_EPHRAIM:
            case CHARACTER_FORDE:
            case CHARACTER_KYLE:
                unit->state &= ~US_DEAD;
                unit->state |= US_HIDDEN | US_BIT16;
                continue;

            case CHARACTER_ORSON_CH5X:
                ClearUnit(unit);
                continue;
        }

        if (0 == (unit->state & US_BIT26))
            unit->state &= ~(US_BIT16 | US_HIDDEN);

    }
}
