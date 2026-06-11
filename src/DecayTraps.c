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

void DecayTraps(void)
{
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap)
    {
        switch (trap->type)
        {

        case TRAP_TORCHLIGHT:
            trap->extra--;

            if (trap->extra == 0)
            {
                RemoveTrap(trap);
                trap--;
            }

            break;

        case TRAP_LIGHT_RUNE:
            trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT]--;

            if (trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] == 0)
            {
                RemoveLightRune(trap);
                trap--;
            }

            break;

        } // switch (trap->type)
    }
}
