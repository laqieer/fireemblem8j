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
extern struct Trap sTrapLast;

void ClearTraps(void)
{
    int i;

    for (i = 0; i < TRAP_MAX_COUNT; ++i)
        sTrapPool[i].type = TRAP_NONE;

    sTrapLast.type = TRAP_NONE;
}
