#include "gbafe.h"

void EkrWhiteINOUT_Loop2(struct ProcEkrDragonScreenFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (void *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->dura2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
