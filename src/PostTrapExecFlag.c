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

void PostTrapExecFlag(void)
{
    // TODO: EID/FLAG DEFINITIONS

    if (CheckFlag(EVFLAG_GAMEOVER) || CountAvailableBlueUnits() == 0)
    {
        CallGameOverEvent();
    }

    if (!AreAnyEnemyUnitDead())
        SetFlag(EVFLAG_DEFEAT_ALL);
}
