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

//! FE8U = 0x08083504
void CallBattleQuoteEventsIfAny(u8 pidA, u8 pidB) {
    struct BattleTalkExtEnt* ent;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return;
    }

    if (gActionData.unitActionType != UNIT_ACTION_COMBAT) {
        return;
    }

    if ((ent = GetBattleQuoteEntry(pidA, pidB), ent != NULL) ||
        (ent = GetBattleQuoteEntry(pidA, 0), ent != NULL) ||
        (ent = GetBattleQuoteEntry(0, pidB)), ent != NULL) {

        if (ent->msg) {
            CallBattleQuoteEventInBattle(ent->msg);
        } else {
            if (ent->event != 0) {
                EventEngine_CreateBattle((u16 *)ent->event);
            }
        }

        SetFlag(ent->flag);
    }

    return;
}
