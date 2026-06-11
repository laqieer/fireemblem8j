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
void UpdateDungeonStats(struct Dungeon* dungeon);

/**
 * If you destroy 200 enemies in a tower or ruins,
 * turn on the flag to join Riev and Hayden
 */
void UnlockPostgameAllyByEnemyCount(void)
{
    struct Dungeon* dungeon = &gDungeonState.current;
    UpdateDungeonStats(dungeon);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) {
        if ((gDungeonState.type == 0) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetFlag(EVFLAG_EXTRA_UNIT(4)); // Riev
        }

        if ((gDungeonState.type == 1) && (dungeon->postgameEnemiesDefeated >= 200)) {
            SetFlag(EVFLAG_EXTRA_UNIT(5)); // Hayden
        }
    }

    return;
}
