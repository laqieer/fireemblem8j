#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

void StartSubSpell_efxBerserkOBJ(struct Anim * anim);

//! FE8U = 0x08062C50
void efxBerserk_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxBerserkOBJ(anim);
        StartSubSpell_efxBerserkBG(anim, 74);
        StartSubSpell_efxBerserkCLONE(anim, 74);

        NewefxRestRST(anim, 74, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 74, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 74)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 4);
        }
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}
