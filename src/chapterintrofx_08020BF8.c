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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ChapterIntro_Bg1And3Scroll[];
extern struct ProcCmd ProcScr_ChapterIntro_Bg2Scroll[];
extern struct ProcCmd ProcScr_ChapterIntro_PutDecalSprite[];

//! FE8U = 0x08020F00
void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFxProc * proc)
{
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    Proc_EndEach(ProcScr_ChapterIntro_Bg2Scroll);
    Proc_EndEach(ProcScr_ChapterIntro_Bg1And3Scroll);
    Proc_EndEach(ProcScr_ChapterIntro_PutDecalSprite);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 2);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->timer = 14;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
    {
        StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
    }

    return;
}
