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

//! FE8U = 0x080209D8
void ChapterIntro_BlendFogAlpha_Loop(struct ChapterIntroFxProc * proc)
{
    SetBlendAlpha(proc->timer, 16);

    if (proc->skipTarget == 3 || (GetGameClock() & 3) == 0)
    {
        if (proc->isSkipping != 0)
        {
            proc->timer += 4;
        }
        else
        {
            proc->timer++;
        }

        if (proc->timer > 5)
        {
            SetBlendAlpha(6, 16);
            Proc_Break(proc);
        }
    }

    return;
}
