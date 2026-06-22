#include "global.h"
#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! JP region-different (US 0x08083EB8 RunPhaseSwitchEvents lacks the goal-type block here)
s8 RunPhaseSwitchEvents(void)
{
    int ret;

    struct EventInfo * pInfo;
    struct EventInfo info;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH)
    {
        return 0;
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_PHASECHANGE);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->turnBasedEvents;
    pInfo = SearchAvailableEvent(&info);

    if (pInfo)
    {
        ClearActiveEventRegistry();

        while (pInfo)
        {
            StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
            pInfo = SearchNextAvailableEvent(&info);
        }

        return 1;
    }

    return ret;
}
