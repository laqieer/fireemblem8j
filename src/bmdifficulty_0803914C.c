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
struct Text* DrawTimeText_WithReset(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation);

void DungeonRecordUi_UpdateValueAnim_Loop(struct BMDifficultyProc* proc) {
    int pos[2];

    proc->unk_34++;

    if (proc->unk_34 < 45) {

        Spline_Eval(&gBmdifficultyEwram_1, proc->unk_34 * 4096, pos);

        PutSpriteExt(
            4,
            (pos[0] >> 4) + ((u8)gBmdifficulty_6.current[proc->labelIndex].x * 8),
            ((pos[1] >> 4) + ((u8)gBmdifficulty_6.current[proc->labelIndex].y * 8)) & 0x000001FF,
            obj_0,
            0x5000
        );
    } else {
        if (proc->labelIndex == 4) {
            DrawTimeText_WithReset(
                &gBmdifficulty_3[1].text[4][0],
                proc->unk_30,
                gBmdifficulty_6.record[4].x,
                gBmdifficulty_6.record[4].y,
                4,
                1
            );
        } else {
            DrawNumberText_WithReset(
                &gBmdifficulty_3[1].text[proc->labelIndex][8 - gBmdifficulty_6.record[proc->labelIndex].numDigits],
                proc->unk_30,
                gBmdifficulty_6.record[proc->labelIndex].numDigits,
                gBmdifficulty_6.record[proc->labelIndex].x,
                gBmdifficulty_6.record[proc->labelIndex].y,
                4
            );
        }

        PlaySoundEffect(SONG_76); // Parameter Up SE
        BG_EnableSyncByMask(1);

        Proc_Break(proc);
    }

    return;
}
