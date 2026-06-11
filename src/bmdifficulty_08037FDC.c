#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"










/* file-scope type definitions used by this run */


struct PostgameUnitLutEntry {
    u16 eid;
    struct UnitDefinition* uDef;
};

struct DungeonUiTextLutEntry {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

/* prototypes for same-file helpers called by this run */
int UpdateDungeonMapTime(struct Dungeon* dungeon);

void UpdateDungeonStats(struct Dungeon* dungeon) {
    int val;
    int i;

    val = dungeon->expEarned;

    val += (PidStatsGetTotalExpGain() - gPlaySt.unk_30.unk_8_2);

    if (val > 50000) {
        val = 50000;
    }

    dungeon->expEarned = val;

    val = dungeon->unitsUsed;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && !(unit->state & US_UNAVAILABLE)) {
            val++;
        }
    }

    dungeon->unitsUsed = val;

    val = dungeon->turnCount; 
    val += gPlaySt.chapterTurnNumber;

    if (val > 500) {
        val = 500;
    }

    dungeon->turnCount = val;

    dungeon->mapTime = UpdateDungeonMapTime(dungeon);

    val = dungeon->enemiesDefeated;
    val += gPlaySt.unk48;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->enemiesDefeated = val;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        val = dungeon->postgameEnemiesDefeated;
        val += gPlaySt.unk48;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->postgameEnemiesDefeated = val;
    }

    return;
}
