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

//! FE8U = 0x08021090
void ChapterIntro_TickTimerMaybe(struct ChapterIntroFxProc * proc)
{
    if (proc->isSkipping != 0)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->timer-- < 0)
    {
        Proc_Break(proc);
    }

    return;
}
