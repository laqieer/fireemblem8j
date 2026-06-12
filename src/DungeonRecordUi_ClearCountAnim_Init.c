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
/* TU-private data externs bound at their JP addresses */
extern int gBmdifficulty_10[];
extern u16 gBmdifficulty_9[];

void DungeonRecordUi_CopyDigitsToObjVram(struct Text* th);

void DungeonRecordUi_ClearCountAnim_Init(struct BMDifficultyProc* proc) {
    DungeonRecordUi_CopyDigitsToObjVram(gBmdifficulty_4);

    gBmdifficultyEwram_1.unk_00 = 2;
    gBmdifficultyEwram_1.unk_02 = 5;
    gBmdifficultyEwram_1.unk_04 = gBmdifficulty_9;
    gBmdifficultyEwram_1.unk_08 = gBmdifficulty_10;
    gBmdifficultyEwram_1.unk_0C = NULL;
    gBmdifficultyEwram_1.unk_10 = NULL;

    proc->unk_38 = 0;

    PlaySoundEffect(SONG_SE_POINT_UP);

    return;
}
