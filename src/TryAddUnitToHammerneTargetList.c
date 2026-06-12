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
/* TU-private data externs bound at their JP addresses */
extern struct Unit* gSubjectUnit;

void TryAddUnitToHammerneTargetList(struct Unit* unit) {
    int i;

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (IsItemHammernable(unit->items[i])) {
            AddTarget(unit->xPos, unit->yPos, unit->index, 0);
            break;
        }
    }

    return;
}
