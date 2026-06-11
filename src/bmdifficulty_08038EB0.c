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
int UpdateDungeonMapTime(struct Dungeon* dungeon);
struct Text* DrawTimeText_WithReset(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation);

void DungeonRecordUi_UpdateRunningTime() {
    struct Dungeon currentDungeon;
    int unkTime1;
    u32 unkTime2;
    s8 drawPunctuation;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    unkTime1 = UpdateDungeonMapTime(&currentDungeon);

    unkTime2 = ((GetGameClock() - gPlaySt.time_chapter_started) % 60);

    drawPunctuation = 1;
    if (unkTime2 > 29) {
        drawPunctuation = 0;
    }

    DrawTimeText_WithReset(
        &gBmdifficulty_3[0].text[4][0],
        unkTime1,
        gBmdifficulty_6.x,
        gBmdifficulty_6.y,
        2,
        drawPunctuation
    );

    BG_EnableSyncByMask(1);

    return;
}
