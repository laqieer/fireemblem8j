#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x08063D1C
void efxLunaSCR2_Loop(struct ProcEfxSCR * proc)
{
    struct ProcEfx * otherProc = proc->unk5C;
    otherProc->unk44 = Interpolate(INTERPOLATE_RSQUARE, 0x4000, 0, proc->timer, proc->unk2E);

    proc->timer++;

    if (proc->timer > proc->unk2E)
    {
        Proc_End(otherProc);
        Proc_Break(proc);
    }

    return;
}
