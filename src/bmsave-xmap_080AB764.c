#include "global.h"
#include "agb_sram.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "bmmap.h"
#include "bmlib.h"

extern EWRAM_DATA struct ExtraMapSaveHead gExtraMapSaveHead;
EWRAM_DATA struct ChapterStats gExtraMapStatus = {0};

extern CONST_DATA u8 *gpSramExtraData;
extern CONST_DATA struct ExtraMapInfo *gExtraMapInfo;

struct ChapterStats *GetCurrentChapterStats(void)
{
    int time;

    time = (GetGameClock() - gPlaySt.time_chapter_started) / 180;
    if (time > 60000)
        time = 60000;

    gExtraMapStatus.chapter_index = gPlaySt.chapterIndex;
    gExtraMapStatus.chapter_turn = gPlaySt.chapterTurnNumber;
    gExtraMapStatus.chapter_time = time;
    return &gExtraMapStatus;
}
