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



//! FE8U = 0x08020FF8
void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFxProc * proc)
{
    CALLARM_ColorFadeTick();

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
    {
        WfxFlamesInitGradientPublic();
    }

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
    {
        proc->timer = 0;
        SetDispEnable(1, 1, 1, 0, 0);
    }
    else
    {
        EnablePaletteSync();
    }

    proc->timer--;

    if (proc->timer < 0)
    {
        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}
