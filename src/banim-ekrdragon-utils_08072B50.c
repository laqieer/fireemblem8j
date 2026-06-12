#include "gbafe.h"

void EkrWhiteINOUT_Loop1(struct ProcEkrDragonScreenFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->dura1);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura1)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
