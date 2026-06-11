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

/* prototypes for same-file helpers called by this run */
void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit));

void TryAddUnitToRefreshTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (!(unit->state & US_UNSELECTABLE)) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex == UNIT_STATUS_13) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRefresh(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRefreshTargetList);

    return;
}
