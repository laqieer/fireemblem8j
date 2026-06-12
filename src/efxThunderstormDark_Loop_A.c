#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805EAF0
void efxThunderstormDark_Loop_A(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->timer2);
    EfxPalBlackInOut(gEfxPal, 0, 32, ret);

    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
