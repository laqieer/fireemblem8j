#include "gbafe.h"

void EkrWhiteINOUT_Loop3(struct ProcEkrDragonScreenFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->dura3);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, ret);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura3)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
