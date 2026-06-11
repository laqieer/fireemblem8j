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

extern EWRAM_OVERLAY(0) u16 gBmdifficulty_0[0x3D0];
extern EWRAM_OVERLAY(0) struct Font gBmdifficulty_1;
extern EWRAM_OVERLAY(0) int gBmdifficulty_2;
extern EWRAM_OVERLAY(0) struct Struct020038C8 gBmdifficulty_3[2];
extern EWRAM_OVERLAY(0) struct Text gBmdifficulty_4[8];
extern EWRAM_OVERLAY(0) u16 gBmdifficulty_5[0x10];

extern const struct Outer080D7FD0 gBmdifficulty_6;

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

s8 DungeonRecordUi_IsNewRecordForLabel(u32 label) {
    int clock;
    struct Dungeon currentDungeon;
    struct Dungeon* record;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    clock = GetGameClock();
    SetGameTime(gBmdifficulty_2);

    UpdateDungeonStats(&currentDungeon);

    SetGameTime(clock);

    record = &gDungeonState.dungeon[gDungeonState.type];

    switch (label) {
        case DUNGEONRECORD_LABEL_MONSTERS:
            return 1;
        case DUNGEONRECORD_LABEL_EXP:
            if (currentDungeon.expEarned > record->expEarned) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_UNITS:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.unitsUsed < record->unitsUsed) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_TURNS:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.turnCount < record->turnCount) {
                return 1;
            }

            break;
        case DUNGEONRECORD_LABEL_TIME:
            if (record->clearCount <= 0) {
                return 1;
            }

            if (currentDungeon.mapTime < record->mapTime) {
                return 1;
            }

            break;
    }

    return 0;
}
