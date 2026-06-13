#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"
#include "bm.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! FE8U = 0x080155C4
void BmMain_BeginNextChapter(void) {
    u8 flag;

    if (CheckFlag(3)) {
        RegisterChapterTimeAndTurnCount(&gPlaySt);
    }

    ComputeChapterRankings();

    flag = (gPlaySt.unk4A_1 & 1);

    ChapterChangeUnitCleanup();
    StartBattleMap(0);

    if (flag == 1) {
        gPlaySt.unk4A_1 = 1;
    }

    return;
}
