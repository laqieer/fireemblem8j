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



//! FE8U = 0x08020C2C
void ChapterIntro_BeginFadeToMap(struct ChapterIntroFxProc * proc)
{
    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->timer = 30;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
    {
        WfxFlamesInitGradientPublic();
    }

    return;
}
