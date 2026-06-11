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

void DungeonRecordUi_CopyDigitsToObjVram(struct Text* th);

void DungeonRecordUi_UpdateValueAnim_Init(struct BMDifficultyProc * proc)
{
    int r7;
    int r8;
    u16 * iter1;
    int * iter2;

    DungeonRecordUi_CopyDigitsToObjVram(&gBmdifficulty_3[0].text[proc->labelIndex][0]);

    gBmdifficultyEwram_1.unk_00 = 2;
    gBmdifficultyEwram_1.unk_04 = gBmdifficulty_5;
    gBmdifficultyEwram_1.unk_08 = gBmdifficultyEwram_0;
    gBmdifficultyEwram_1.unk_0C = NULL;
    gBmdifficultyEwram_1.unk_10 = NULL;

    iter1 = gBmdifficulty_7;
    iter2 = gBmdifficulty_8;

    gBmdifficultyEwram_1.unk_02 = r8 = 6;

    for (r7 = 0; r7 < r8; r7++)
    {
        gBmdifficulty_5[r7] = DivArm(4096, iter1[r7] * 45);

        gBmdifficultyEwram_0[r7 * 2 + 0] = iter2[r7 * 2 + 0] << 4;
        gBmdifficultyEwram_0[r7 * 2 + 1] = iter2[r7 * 2 + 1] << 4;
    }

    proc->unk_34 = 0;

    PlaySoundEffect(SONG_SE_POINT_UP); // Point Up SE

    return;
}
