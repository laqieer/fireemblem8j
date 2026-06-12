#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/video-banim.h"

void EfxFlashUnitEffectRestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(OBPAL_EFX_UNIT_L), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(OBPAL_EFX_UNIT_R), 0x20);
        BanimSetFrontPaletteForDragon(proc->anim);
    }

    EnablePaletteSync();
    Proc_Break(proc);
    proc->anim->state3 |= ANIM_BIT3_BLOCKEND;
}
