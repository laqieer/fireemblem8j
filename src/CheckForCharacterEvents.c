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

//! FE8U = 0x08083F68
s8 CheckForCharacterEvents(u8 pidA, u8 pidB) {
    struct EventInfo info;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return 0;
    }

    info.listScript = GetChapterEventDataPointer(gPlaySt.chapterIndex)->characterBasedEvents;
    info.pidA = pidA;
    info.pidB = pidB;

    if (SearchAvailableEvent(&info)) {
        return 1;
    }

    return 0;
}
