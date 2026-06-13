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
#include "event.h"
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

//! FE8U = 0x08084508
s8 StartAfterUnitMovedEvent(void) {
    int ret;
    struct EventInfo info;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return 0;
    }

    ret = RunTutorialEvent(TUTORIAL_EVT_TYPE_AFTERMOVE);

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->specialEventsAfterUnitMoved;

    if (SearchAvailableEvent(&info)) {
        ClearActiveEventRegistry();
        StartEventFromInfo(&info, EV_EXEC_CUTSCENE);
        return 1;
    }

    return ret;
}
