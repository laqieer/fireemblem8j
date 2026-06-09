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

u32 GetRecordDungeonValueByUiLabel(u32 label) {

    switch (label) {
        case DUNGEONRECORD_LABEL_MONSTERS:
            return gDungeonState.dungeon[gDungeonState.type].enemiesDefeated;
        case DUNGEONRECORD_LABEL_EXP:
            return gDungeonState.dungeon[gDungeonState.type].expEarned;
        case DUNGEONRECORD_LABEL_UNITS:
            return gDungeonState.dungeon[gDungeonState.type].unitsUsed;
        case DUNGEONRECORD_LABEL_TURNS:
            return gDungeonState.dungeon[gDungeonState.type].turnCount;
        case DUNGEONRECORD_LABEL_TIME:
            return gDungeonState.dungeon[gDungeonState.type].mapTime;
    }

    return DUNGEONRECORD_LABEL_MONSTERS;
}
