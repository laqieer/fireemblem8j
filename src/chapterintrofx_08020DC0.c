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

// clang-format off

extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg2Scroll[];



extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[];







extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_PutDecalSprite[];

extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



//! FE8U = 0x080210C8
void ChapterIntro_End(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
    {
        RefreshBMapGraphics();
        ForceScreenToBlack();
    }

    return;
}
