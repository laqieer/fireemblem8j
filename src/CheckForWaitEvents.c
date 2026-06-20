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

//! FE8U = 0x08084330
s8 CheckTutorialEvent(int type);
s8 CheckForWaitEvents(void) {
    int ret;
    struct EventInfo info;

    if (AreAnyEnemyUnitDead() == 0) {
        SetFlag(EVFLAG_DEFEAT_ALL);

        if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
            return 1;
        }
    } else {
        ClearFlag(EVFLAG_DEFEAT_ALL);
    }

    if (!CheckFlag(EVFLAG_GAMEOVER) && (CountAvailableBlueUnits() != 0)) {
        if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
            return 0;
        }

        ret = CheckTutorialEvent(TUTORIAL_EVT_TYPE_POSTACTION);

        info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->miscBasedEvents;
        info.xPos = gActiveUnit->xPos;
        info.yPos = gActiveUnit->yPos;

        if (SearchAvailableEvent(&info) == 0) {
            return ret;
        }
    }

    return 1;
}
