#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"

void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind);

//! FE8U = 0x08061448
void efxReblow_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        StartSubSpell_efxReblowOBJ(proc->anim, 0);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 151)
    {
        StartSubSpell_efxReblowOBJ(proc->anim, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 161)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 211)
    {
        NewEfxHpBarLive(anim);
        return;
    }
    else if (proc->timer == duration + 221)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if ((GetAnimNextRoundType(anim) << 16) != 0xFFFF0000)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}
