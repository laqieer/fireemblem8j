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



//! FE8U = 0x08061A64
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        anim->pScrStart = AnimScr_EfxLiveOBJ2;
        anim->pScrCurrent = AnimScr_EfxLiveOBJ2;

        anim->timer = 0;
        proc->timer = 0;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08061A98
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
