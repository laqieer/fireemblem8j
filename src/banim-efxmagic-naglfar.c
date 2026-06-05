#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x08068638
void efxNaglfarBlack_Loop_A(struct ProcEfx * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 0, 0x20, 0);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer = 0;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08068680
void efxNaglfarBlack_Loop_B(struct ProcEfx * proc)
{
    int ret = Interpolate(0, 0, 16, proc->timer, proc->unk30);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 4, 2, ret);
    EfxPalBlackInOut(gEfxPal, 6, 10, ret);
    EfxPalBlackInOut(gEfxPal, 23, 1, ret);
    EfxPalBlackInOut(gEfxPal, 25, 1, ret);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->unk30)
    {
        proc->timer = 0;
        SetDispEnable(1, 1, 0, 0, 1);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08068738
void efxNaglfarBlack_Loop_C(struct ProcEfx * proc)
{
    int ret = Interpolate(0, 16, 0, proc->timer, proc->unk30);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 4, 2, 0x10);
    EfxPalBlackInOut(gEfxPal, 6, 10, 0x10);
    EfxPalBlackInOut(gEfxPal, 23, 1, ret);
    EfxPalBlackInOut(gEfxPal, 25, 1, ret);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->unk30)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080687D0
void efxNaglfarBlack_Loop_D(struct ProcEfx * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
    return;
}
