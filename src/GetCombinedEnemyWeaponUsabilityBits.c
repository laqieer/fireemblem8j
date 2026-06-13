#include "global.h"
#include "bmunit.h"

int GetCombinedEnemyWeaponUsabilityBits(void) {
    int i, result = 0;

    for (i = 0x81; i < 0xC0; ++i) {
        struct Unit* unit = gUnitLookup[i & 0xFF];

        if (UNIT_IS_VALID(unit))
            result |= GetUnitWeaponUsabilityBits(unit);
    }

    return result;
}
