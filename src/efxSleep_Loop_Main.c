#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

//! FE8U = 0x080626B4
void efxSleep_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSleepOBJ(proc->anim);
        PlaySFX(0x11B, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 100)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 130)
    {
        StartSubSpell_efxSleepOBJ2(anim);
        StartSubSpell_efxSleepSE(anim);

        StartSubSpell_efxSleepBG(proc->anim);

        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 230, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 330)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && GetUnitEfxDebuff(anim) == 0)
        {
            SetUnitEfxDebuff(anim, 2);
        }
    }
    else if (proc->timer == duration + 370)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}
