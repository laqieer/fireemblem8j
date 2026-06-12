#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "rng.h"
#include "bmitem.h"
#include "bmphase.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "cp_utility.h"

//! FE8U = 0x0803C364
int AiCountCurrentPhaseFlaggedUnits(void) {
    int count = 0;
    int i, alliance = GetCurrentPhase();

    for (i = alliance + 1; i < alliance + 0x80; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if (unit->aiFlags & AI_FLAG_0) {
            count++;
        }
    }

    return count;
}
