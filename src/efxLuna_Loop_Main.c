#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x080639B0
void efxLuna_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxLunaBG(anim);

        SetWinEnable(0, 0, 0);

        SetBlendAlpha(0, 16);

        NewEfxALPHA(anim, 0, 10, 0, 0x10, 0);
        StartSubSpell_efxLunaRST(anim, NewefxRestRST(anim, 20, 15, 0x100, 2), 20);
        NewEfxRestWINH(anim, 20, gLCDControlBuffer.bgoffset[BG_1].x, 0);

        PlaySFX(0x2BD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 41)
    {
        StartSubSpell_efxLunaSCR();
        NewEfxRestWINH_(anim, 21, 1);
        StartSubSpell_efxLunaOBJ(anim);
        NewEfxALPHA(anim, 0, 25, 16, 0, 0);
    }
    else if (proc->timer == duration + 55)
    {
        PlaySFX(0x2BE, 0x100, anim->xPosition, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxLunaBG2(anim, 65);
        StartSubSpell_efxLunaBGCOL(anim, 65);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewefxRestRST(anim, 65, 2, 128, 1);
        NewEfxRestWINH_(anim, 68, 0);
    }
    else if (proc->timer == duration + 135)
    {
        NewEfxFlashBgWhite(anim, 5);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 140)
    {
        BG_SetPosition(BG_1, 0, 0);
        StartSubSpell_efxLunaBG3(proc->anim);
    }
    else if (proc->timer == duration + 190)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
