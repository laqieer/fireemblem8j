#include "global.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "bmarch.h"

static inline void ClearBallistaOccupied(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

void TryRemoveUnitFromBallista(struct Unit* unit) {
    struct Trap* trap;

    if ((unit->state & US_IN_BALLISTA) != 0) {
        trap = GetTrap(unit->ballistaIndex);

        unit->state &= ~US_IN_BALLISTA;

        ClearBallistaOccupied(trap);

        unit->ballistaIndex = 0;

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;

        RefreshUnitSprites();
    }

    return;
}
