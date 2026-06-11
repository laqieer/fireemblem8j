#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxSongBG(struct Anim * anim, int kind);
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind);

//! FE8U = 0x0805CC14
void efxDance_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        StartSubSpell_efxSongBG(anim, 0);
        StartSubSpell_efxSongOBJ(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 125)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 0x20);
        }
        else
        {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
