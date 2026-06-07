#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0805F868
void efxResireRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;

    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0, 128, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
