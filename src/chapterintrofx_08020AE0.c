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



//! FE8U = 0x08020DE8
void ChapterIntro_RevealDecalSprite_Loop(struct ChapterIntroFxProc * proc)
{
    int hWinOffs = Interpolate(INTERPOLATE_RCUBIC, 0, DISPLAY_WIDTH / 2, proc->timer, 40);

    SetWin0Box((DISPLAY_WIDTH / 2) - hWinOffs, 0, hWinOffs + (DISPLAY_WIDTH / 2), DISPLAY_HEIGHT);

    proc->timer++;

    if (proc->timer > 40)
    {
        Proc_Break(proc);
    }

    return;
}
