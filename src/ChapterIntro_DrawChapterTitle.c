#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/songs.h"

void DrawChapterTitleStrEx_jp(void *, int, int);



void ChapterIntro_DrawChapterTitle(void)
{
    int titleId;

    BG_Fill(gBG0TilemapBuffer, TILEREF(0x280, 1));

    ApplyChapterTitlePal(8, 5);
    titleId = GetChapterTitleWM(&gPlaySt);
    _PutChapterTitleGfx(0x280, titleId);
    DrawChapterTitleStrEx_jp(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 9), 5, titleId);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
