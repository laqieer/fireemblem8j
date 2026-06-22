#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

void sub_805DD38(void * anim, int a2);
void sub_805DE30(struct Anim * anim, int a2);
void sub_805DF40(void * anim);

//! JP 0x0805DC9C - region-different efx spell loop
void sub_805DC9C(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFlashBgWhite(proc->anim, 6);
    }
    else if (proc->timer == 6)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);

        sub_805DD38(anim, 9);
        sub_805DE30(anim, 9);
        sub_805DF40(anim);

        PlaySFX(0x10C, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 10)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == 25)
    {
        return;
    }
    else if (proc->timer == 30)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
