#include "global.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmtrick.h"
#include "bmmap.h"

void UnitFinalizeMovement(struct Unit* unit) {
    if (unit->state & US_RESCUING) {
        struct Unit* rescuee = gUnitLookup[unit->rescue];

        rescuee->xPos = unit->xPos;
        rescuee->yPos = unit->yPos;
    }

    if (unit->state & US_IN_BALLISTA) {
        struct Trap* trap = GetTrap(unit->ballistaIndex);

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;
    }
}
