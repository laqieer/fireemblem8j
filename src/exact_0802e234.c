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



 void GenerateFireTileTrapTargets(int x, int y, int damage);
 void GenerateArrowTrapTargets(int x, int y, int damage);
 void GenerateGasTrapTargets(int x, int y, int damage, int facing);
 s8 ShouldSkipGasTrapDisplay(int x, int y, int facing);




struct Trap* RemoveTrap(struct Trap* trap)
{
    while (trap->type != TRAP_NONE)
    {
        *trap++ = *(trap + 1);
    }

    // return trap; // BUG
}
