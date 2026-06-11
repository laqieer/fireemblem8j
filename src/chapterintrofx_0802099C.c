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





extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[];









extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



//! FE8U = 0x08020CA4
void ChapterIntro_LoopFadeToMap(struct ChapterIntroFxProc * proc)
{
    if ((GetGameClock() & 1) == 0)
    {
        CALLARM_ColorFadeTick();

        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
        {
            WfxFlamesInitGradientPublic();
        }

        if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
        {
            if (GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
            {
                StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
            }

            proc->timer = 0;

            SetDispEnable(1, 1, 1, 0, 0);
        }
        else
        {
            int bldAmt;
            EnablePaletteSync();

            bldAmt = (proc->timer + 7) / 8;
            SetBlendAlpha(bldAmt + 12, 4 - bldAmt);
        }

        proc->timer--;

        if (proc->timer == 24 && GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
        {
            StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
        }

        if (proc->timer < 0)
        {
            ResetMapPaletteAnimations();
            Proc_Break(proc);
        }
    }

    return;
}
