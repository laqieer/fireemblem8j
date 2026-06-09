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

void UpdateDungeonRecordStats() {
    struct Dungeon* current;
    struct Dungeon* record;
    int val;

    current = &gDungeonState.current;
    record = &gDungeonState.dungeon[gDungeonState.type];

    if (record->clearCount > 0) {
        if (record->expEarned < current->expEarned) {
            record->expEarned = current->expEarned;
        }

        if (current->unitsUsed < record->unitsUsed) {
            record->unitsUsed = current->unitsUsed;
        }

        if (current->turnCount < record->turnCount) {
            record->turnCount = current->turnCount;
        }

        if (current->mapTime < record->mapTime) {
            record->mapTime = current->mapTime;
        }
    } else {
        record->expEarned = current->expEarned;
        record->unitsUsed = current->unitsUsed;

        record->turnCount = current->turnCount;
        record->mapTime = current->mapTime;
    }

    val = record->enemiesDefeated + current->enemiesDefeated;

    if (val > 50000) {
        val = 50000;
    }

    record->enemiesDefeated = val;

    if (record->clearCount < 100) {
        record->clearCount++;
    }

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        if (record->postgameClearCount < 10) {
            record->postgameClearCount++;
        }
    }

    return;
}

void UpdateDungeonEnemiesDefeated() {
    struct Dungeon* current;
    struct Dungeon* dungeon;
    int val;

    current = &gDungeonState.current;
    dungeon = &gDungeonState.dungeon[gDungeonState.type];

    val = dungeon->enemiesDefeated + current->enemiesDefeated;

    if (val > 50000) {
        val = 50000;
    }

    dungeon->enemiesDefeated = val;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        val = dungeon->postgameEnemiesDefeated + current->postgameEnemiesDefeated;

        if (val > 1000) {
            val = 1000;
        }

        dungeon->postgameEnemiesDefeated = val;
    }

    return;
}
