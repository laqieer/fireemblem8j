#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/video-banim.h"

void EfxFlashUnitEffectMain(struct ProcEfxFlashing * proc)
{
    if (++proc->timer < proc->terminator)
        return;

    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(Pal_BanimUnitFlashing, PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        EfxBgFlashingForDragon(proc->anim);
    }

    EnablePaletteSync();

    if (proc->timer >= proc->terminator2)
    {
        struct Anim * anim = proc->anim;
        anim->state3 |= ANIM_BIT3_BLOCKEND;
        anim->state  &= ~ANIM_BIT_FROZEN;
        anim->timer   = 0;
        Proc_Break(proc);
    }
}
