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

struct Trap* RemoveLightRune(struct Trap* trap)
{
    gBmMapTerrain[trap->yPos][trap->xPos] = GetTrueTerrainAt(trap->xPos, trap->yPos);
    return RemoveTrap(trap);
}
