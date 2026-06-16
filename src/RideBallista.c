#include "global.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "bmarch.h"

extern inline void SetBallistaOccupied(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 1;
}

void RideBallista(struct Unit* unit) {
    struct Trap* trap = GetTrapAt(unit->xPos, unit->yPos);

    SetBallistaOccupied(trap);

    RefreshUnitSprites();

    unit->state |= US_IN_BALLISTA;

    unit->ballistaIndex = TRAP_INDEX(trap);

    return;
}
