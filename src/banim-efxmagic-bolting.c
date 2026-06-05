#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0805E9B0
void efxThunderstormColor_Loop_A(struct ProcEfxBGCOL * proc)
{
    PlaySFX(0x11a, 0x100, proc->anim->xPosition, 1);

    NewEfxFlashBgWhite(proc->anim, 38);

    proc->timer = 0;
    proc->timer2 = 5;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805E9E4
void efxThunderstormColor_Loop_B(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);

    EfxPalWhiteInOut(gEfxPal, 0, 32, ret);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        proc->timer2 = 10;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805EA4C
void efxThunderstormColor_Loop_C(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);
    SetBlendAlpha(ret, 16);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}
