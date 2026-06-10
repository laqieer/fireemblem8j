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

struct Trap* AddTrap(int x, int y, int trapType, int meta)
{
    struct Trap* trap;

    // Find first free trap
    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {}

    trap->xPos = x;
    trap->yPos = y;
    trap->type = trapType;
    trap->extra = meta;

    return trap;
}
