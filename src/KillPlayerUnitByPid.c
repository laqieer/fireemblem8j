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

//! FE8U = 0x08083654
void KillPlayerUnitByPid(u16 pid) {
    struct Unit* unit;
    int i;
    int x;
    int y;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->pCharacterData->number != pid) {
            continue;
        }

        if (unit->state & US_DEAD) {
            continue;
        }

        PidStatsRecordDefeatInfo(pid, 0, DEFEAT_CAUSE_7);
        UnitKill(unit);
        SetUnitHp(unit, 0);

        if (gBattleActor.unit.index == unit->index) {
            gBattleActor.unit = *unit;
        }

        if (gBattleTarget.unit.index == unit->index) {
            gBattleTarget.unit = *unit;
        }

        if (unit->state & US_RESCUED) {
            UnitDrop(GetUnit(unit->rescue), 0, 0);
        }

        if (!(unit->state & US_RESCUING)) {
            return;
        }

        UnitGetDeathDropLocation(unit, &x, &y);
        UnitDrop(unit, x, y);

        return;
    }

    return;
}
