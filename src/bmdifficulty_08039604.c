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
struct Text* DrawNumberText_WithReset(struct Text* th, u16 number, u8 numTiles, s8 x, s8 y, u8 colorId);

void DungeonRecordUi_UpdateEnemiesDefeatedCount(struct BMDifficultyProc* proc) {

    proc->unk_30++;

    if ((proc->unk_34 - proc->unk_30) > 100) {
        proc->unk_30++;
    }

    DrawNumberText_WithReset(
        &gBmdifficulty_3[1].text[0][8 - gBmdifficulty_6.record[0].numDigits],
        proc->unk_30,
        gBmdifficulty_6.record[0].numDigits,
        gBmdifficulty_6.record[0].x,
        gBmdifficulty_6.record[0].y,
        2
    );

    DrawNumberText_WithReset(
        &gBmdifficulty_3[0].text[0][8 - gBmdifficulty_6.current[0].numDigits],
        (proc->unk_34 - proc->unk_30),
        gBmdifficulty_6.current[0].numDigits,
        gBmdifficulty_6.current[0].x,
        gBmdifficulty_6.current[0].y,
        2
    );

    BG_EnableSyncByMask(1);

    if (proc->unk_3c > 0) {
        proc->unk_3c--;
    }

    if (proc->unk_30 >= proc->unk_34) {
        Proc_Break(proc);
    }

    return;
}
