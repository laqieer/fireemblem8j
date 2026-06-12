#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"

//! FE8U = 0x08081208
void GlowCrossExit_Loop(struct MAEffectProc * proc)
{
    proc->frame++;

    if (proc->frame < proc->timer)
    {
        SetBlendAlpha(16 - (proc->frame * 16) / proc->timer, 16);
    }
    else
    {
        SetBlendAlpha(0, 16);
        Proc_Break(proc);
    }

    return;
}
