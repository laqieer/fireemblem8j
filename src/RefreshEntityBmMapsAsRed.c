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

void RefreshEntityBmMapsAsRed(void)
{
    int truePhase = gPlaySt.faction;
    gPlaySt.faction = FACTION_RED;

    RefreshEntityBmMaps();

    gPlaySt.faction = truePhase;
}
