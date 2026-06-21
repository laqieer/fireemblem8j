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

//! FE8U = 0x08025A14
void MakeGorgonEggHatchTargetList(int faction)
{
    int i;
    int damage;

    // Amount that the Gorgon Egg "heals" per turn
    damage = 5;

    InitTargets(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);
        struct Trap * trap;
        int delay;

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16))
        {
            continue;
        }

        if (unit->statusIndex != UNIT_STATUS_RECOVER)
        {
            continue;
        }

        trap = GetTypedTrapAt(unit->xPos, unit->yPos, TRAP_GORGON_EGG);

        if (trap == NULL)
        {
            continue;
        }

        // If the egg was assigned a "delay", count down this value first.
        // The egg does not start healing until the "delay" is 0.

        delay = (u8)trap->data[TRAP_EXTDATA_TRAP_TURNFIRST] - 1;

        if (delay > 0)
        {
            trap->data[TRAP_EXTDATA_TRAP_TURNFIRST] = delay;
            trap->data[TRAP_EXTDATA_TRAP_COUNTER] = trap->data[TRAP_EXTDATA_TRAP_TURNNEXT];

            continue;
        }

        trap->data[TRAP_EXTDATA_TRAP_TURNFIRST] = 0;

        trap->data[TRAP_EXTDATA_TRAP_COUNTER]++;

        // Only heal the egg if the turn counter is greater than the interval.
        // In vanilla FE8, the interval is hard-coded to 1 (i.e. the egg heals every turn).

        if (trap->data[TRAP_EXTDATA_TRAP_COUNTER] < trap->data[TRAP_EXTDATA_TRAP_TURNNEXT])
        {
            continue;
        }

        trap->data[TRAP_EXTDATA_TRAP_COUNTER] = 0;
        AddTarget(unit->xPos, unit->yPos, unit->index, damage);
    }

    return;
}
