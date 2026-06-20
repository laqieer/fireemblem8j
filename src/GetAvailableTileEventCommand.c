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

//! FE8U = 0x08084078
int GetAvailableTileEventCommand(s8 x, s8 y) {
    struct EventInfo info;
    int xx = x;
    int yy = y;

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->locationBasedEvents;
    info.xPos = xx;
    info.yPos = yy;

    if (SearchAvailableEvent(&info) && (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)) {
        return info.commandId;
    }

    return 0;
}
