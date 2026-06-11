#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x080618F4
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int coeffA;

    if (proc->timer > proc->unk2E)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
    else
    {
        if (proc->unk29 == 0)
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
        }
        else
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
        }

        SetBlendAlpha(coeffA, 16);

        proc->timer++;
    }

    return;
}
