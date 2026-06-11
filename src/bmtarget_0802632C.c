#include "global.h"

#include "bmmap.h"
#include "bmunit.h"
#include "uiselecttarget.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmreliance.h"
#include "bmarch.h"
#include "rng.h"
#include "bmsave.h"
#include "eventinfo.h"

#include "constants/classes.h"
#include "constants/terrains.h"

extern struct Unit* EWRAM_DATA gSubjectUnit;

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);

void MakeTargetListForLatona(struct Unit* unit) {
    int phase;
    int i;

    InitTargets(unit->xPos, unit->yPos);

    phase = GetCurrentPhase();

    for (i = phase + 1; i < phase + 0x80; i++) {
        struct Unit* other = GetUnit(i);

        if (!UNIT_IS_VALID(other)) {
            continue;
        }

        if (other->state & US_UNAVAILABLE) {
            continue;
        }

        if ((GetUnitCurrentHp(other) == GetUnitMaxHp(other)) && (other->statusIndex == UNIT_STATUS_NONE)) {
            continue;
        }

        if (other == unit) {
            continue;
        }

        AddTarget(other->xPos, other->yPos, other->index, 0);
    }

    return;
}
