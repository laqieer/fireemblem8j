#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "rng.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmmenu.h"
#include "bmguide.h"
#include "constants/chapters.h"
#include "constants/worldmap.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080BC1B8
void MapRoute_TransitionLoop(struct GmRouteProc * proc)
{
    proc->unk_3e++;

    if (proc->unk_3e < proc->unk_3c)
    {
        int coeff = (proc->unk_3e * 0x10) / proc->unk_3c;
        SetBlendAlpha(coeff, 0x10 - coeff);
    }
    else
    {
        CpuFastCopy(BG_GetMapBuffer(proc->bgB), BG_GetMapBuffer(proc->bgA), 0x800);
        BG_EnableSync(proc->bgA);

        Proc_Break(proc);
    }

    return;
}
