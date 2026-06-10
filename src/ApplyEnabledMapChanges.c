#include "global.h"
#include "constants/terrains.h"
#include "constants/event-flags.h"
#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "uiselecttarget.h"
#include "bmtarget.h"
#include "bmudisp.h"
#include "bmusailment.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[TRAP_MAX_COUNT];
extern inline struct Trap* GetTrap(int id) {
    return sTrapPool + id;
}

void ApplyEnabledMapChanges(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_MAPCHANGE:
            ApplyMapChangesById(trap->extra);
            break;

        case TRAP_MAPCHANGE2:
            // this is a mystery
            ApplyMapChangesById(trap->extra ? trap->yPos : trap->xPos);
            break;

        } // switch (trap->type)
    }
}
