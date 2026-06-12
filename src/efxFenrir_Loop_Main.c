#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

void StartSubSpell_efxFenrirBG2_A(struct Anim * anim);

//! FE8U = 0x080608E0
void efxFenrir_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxFenrirBG(anim, 100);
        StartSubSpell_efxFenrirBGCOL(anim, 100);

        NewefxRestRST(anim, 100, 2, 0x100, 1);
        NewEfxRestWINH_(anim, 105, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 70, 15, 16, 0, 0);

        PlaySFX(0x130, 0x100, 120, 0);

        return;
    }

    if (proc->timer == duration + 40)
    {
        StartSubSpell_efxFenrirOBJ(anim, 74);
        PlaySFX(0x131, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 110)
    {
        StartSubSpell_efxFenrirBG2_A(anim);
    }
    else if (proc->timer == duration + 111)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 139)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 153)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 167)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 181)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 195)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 209)
    {
        PlaySFX(0x132, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 238)
    {
        NewEfxFlashBgWhite(anim, 10);
        StartSubSpell_efxFenrirOBJ2(anim);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        PlaySFX(0x133, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 248)
    {
        StartSubSpell_efxFenrirBG2_B(anim);
        NewEfxALPHA(anim, 18, 8, 16, 0, 0);
    }
    else if ((proc->timer != duration + 290) && (proc->timer == duration + 300))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
