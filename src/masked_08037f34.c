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

void SaveDungeonState(struct Dungeon* savedDungeon) {

    *savedDungeon = gDungeonState.current;
    gDungeonState.current.unk_0B_4 = gDungeonState.type;

    return;
}

void LoadDungeonState(struct Dungeon* savedDungeon) {

    gDungeonState.current = *savedDungeon;
    gDungeonState.type = gDungeonState.current.unk_0B_4;

    return;
}

void SaveDungeonRecords(struct Dungeon* savedDungeon) {

    memcpy(savedDungeon, gDungeonState.dungeon, 2 * sizeof(struct Dungeon));

    return;
}

void LoadDungeonRecords(struct Dungeon* savedDungeon) {

    memcpy(gDungeonState.dungeon, savedDungeon, 2 * sizeof(struct Dungeon));

    return;
}
