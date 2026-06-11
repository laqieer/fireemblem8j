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















extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];



extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



//! FE8U = 0x0801FDBC
void ChapterIntro_KeyListen_Loop(struct ChapterIntroFxProc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        if (((struct ChapterIntroFxProc *)proc->proc_parent)->isSkipping != 0)
        {
            proc->skipTarget = 1;
        }
        else
        {
            ((struct ChapterIntroFxProc *)proc->proc_parent)->isSkipping = 1;
        }
    }

    if (proc->skipTarget != 0)
    {
        struct ChapterIntroFxProc * parent = proc->proc_parent;

        if (parent->skipTarget != 0)
        {
            Proc_Goto(parent, parent->skipTarget);
            Proc_End(proc);
        }
    }

    return;
}
