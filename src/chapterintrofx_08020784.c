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



//! FE8U = 0x08020A8C
void ChapterIntro_2(struct ChapterIntroFxProc * proc)
{
    if ((GetGameClock() & 3) == 0)
    {
        CALLARM_ColorFadeTick();
        EnablePaletteSync();

        proc->timer--;

        if (proc->timer < 0)
        {
            SetDispEnable(1, 0, 0, 0, 1);
            SetBackgroundTileDataOffset(BG_2, 0);

            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
            EnablePaletteSync();

            Proc_Break(proc);
        }
    }

    return;
}
