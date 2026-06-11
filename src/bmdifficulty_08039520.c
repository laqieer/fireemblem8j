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

void DungeonRecordUi_ClearCountAnim_Loop(struct BMDifficultyProc* proc) {
    int val;
    int pos[2];
    struct Dungeon record;

    proc->unk_38++;

    if (proc->unk_38 < 30) {
        Spline_Eval(&gBmdifficultyEwram_1, proc->unk_38 * 0x1000, pos);

        PutSpriteExt(
            4,
            pos[0] >> 4,
            ((u32)(pos[1]) << 0x13) >> 0x17,
            obj_0,
            0x5000
        );
    } else {

        record = gDungeonState.dungeon[gDungeonState.type];

        val = record.clearCount;

        if (val < 100) {
            val++;
        }

        DrawNumberText_WithReset(
            &gBmdifficulty_4[5],
            val,
            3,
            0x1A,
            7,
            2
        );

        BG_EnableSyncByMask(1);

        PlaySoundEffect(SONG_76);

        Proc_Break(proc);
    }

    return;
}
