#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmudisp.h"

void RefreshAllies(void) {
    int i;

    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = gUnitLookup[i & 0xFF];

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->state = unit->state &~ (US_UNSELECTABLE | US_RESCUING | US_RESCUED);
        unit->rescue = 0;

        SetUnitStatus(unit, 0);
    }

    RefreshEntityBmMaps();
    RefreshUnitSprites();
}
