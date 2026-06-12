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

void AddAsTarget_IfCanStealFrom(struct Unit* unit) {
    int i;

    if (UNIT_FACTION(unit) != FACTION_RED) {
        return;
    }

    if (gActiveUnit->spd < unit->spd) {
        return;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = unit->items[i];

        if (item == 0) {
            return;
        }

        if (!IsItemStealable(item)) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
        return;
    }

    return;
}
