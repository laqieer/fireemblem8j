extern int CheckTutorialEvent();
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

//! FE8U = 0x08084560
s8 CheckBattleForecastTutorialEvent(void) {
    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return 0;
    }

    return CheckTutorialEvent(TUTORIAL_EVT_TYPE_FORECAST);
}

//! FE8U = 0x0808457C
void StartBattleForecastTutorialEvent(void) {
    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return;
    }

    RunTutorialEvent(TUTORIAL_EVT_TYPE_FORECAST);
    return;
}

//! FE8U = 0x08084590
void StartPlayerPhaseStartTutorialEvent(void) {
    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) {
        return;
    }

    RunTutorialEvent(TUTORIAL_EVT_TYPE_PLAYERPHASE);
    return;
}

//! FE8U = 0x080845A4
void ClearActiveEventRegistry(void) {
    memset(&gActiveEventRegistry, 0, sizeof(gActiveEventRegistry));
    return;
}

//! FE8U = 0x080845B8
void RegisterEventActivation(u32 script, u16 flag)
{
    gActiveEventRegistry.scripts[gActiveEventRegistry.idx] = script;
    gActiveEventRegistry.flags[gActiveEventRegistry.idx] = flag;
    gActiveEventRegistry.idx++;
}
