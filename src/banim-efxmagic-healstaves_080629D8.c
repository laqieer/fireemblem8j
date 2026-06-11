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



//! FE8U = 0x080618D8
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    proc->timer--;

    if (proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}
