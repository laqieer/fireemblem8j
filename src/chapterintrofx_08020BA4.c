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



//! FE8U = 0x08020EAC
void ChapterIntro_LoopFadeOut(struct ChapterIntroFxProc * proc)
{
    CALLARM_ColorFadeTick();
    EnablePaletteSync();

    proc->timer--;

    if (proc->timer < 0)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBackgroundTileDataOffset(BG_2, 0);
        Proc_Break(proc);
    }

    return;
}
