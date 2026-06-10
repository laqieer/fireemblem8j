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

void DisableMapChange(int id)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        if (trap->type == TRAP_MAPCHANGE && trap->extra == id)
            RemoveTrap(trap);
    }
}
