#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxStoneBG(struct Anim * anim);
void StartSubSpell_efxStoneOBJ(struct Anim * anim, int terminator);

//! FE8U = 0x08067510
void efxStone_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 10)
    {
        PlaySFX(0x3b8, 0x100, anim->xPosition, 1);
        StartSubSpell_efxStoneOBJ(anim, 200);
    }
    else if (proc->timer == duration + 72)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        if (!proc->hitted)
        {
            PlaySFX(0x3B9, 0x100, anim->xPosition, 1);

            StartSubSpell_efxStoneBG(anim);

            if (GetUnitEfxDebuff(anim) == UNIT_STATUS_NONE)
            {
                SetUnitEfxDebuff(anim, UNIT_STATUS_PETRIFY);
            }
        }

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
    }
    else if (proc->timer == duration + 236)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
