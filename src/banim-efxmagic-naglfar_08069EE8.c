#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxNaglfarBG(struct Anim * anim);
void StartSubSpell_efxNaglfarBG2(struct Anim * anim);
void StartSubSpell_efxNaglfarBG3(struct Anim * anim);
void StartSubSpell_efxNaglfarBG4(struct Anim * anim);
void StartSubSpell_efxNaglfarOBJ2(struct Anim * anim, int terminator, u8 c);
void StartSubSpell_efxNaglfarOBJRockGyre(struct Anim * anim, int terminator);
void StartSubSpell_efxNaglfarBlack(struct Anim * anim, int b, int c);

//! FE8U = 0x08067BB8
void efxNaglfar_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 26)
    {
        NewEfxRestWINH_(anim, 62, 1);
        NewEfxTwobaiRST(anim, 62);

        StartSubSpell_efxNaglfarBG(anim);
        NewEfxALPHA(anim, 0, 30, 0, 16, 0);

        StartSubSpell_efxNaglfarOBJ2(anim, 5, 0);
        PlaySFX(0x3AF, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 50)
    {
        NewEfxFlashBgWhite(anim, 2);
    }
    else if (proc->timer == duration + 55)
    {
        StartSubSpell_efxNaglfarOBJ2(anim, 4, 1);
    }
    else if (proc->timer == duration + 56)
    {
        NewEfxALPHA(anim, 0, 30, 16, 0, 0);
    }
    else if (proc->timer == duration + 66)
    {
        NewEfxFlashBgWhite(anim, 2);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxNaglfarBlack(anim, 0, 30);
        StartSubSpell_efxNaglfarOBJ2(anim, 4, 1);
    }
    else if (proc->timer == duration + 110)
    {
        NewEfxRestWINH_(anim, 104, 1);
        NewEfxTwobaiRST(anim, 104);
        StartSubSpell_efxNaglfarBG2(anim);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxWhiteOUT(anim, 0, 30);
    }
    else if (proc->timer == duration + 196)
    {
        SetDispEnable(1, 1, 1, 1, 1);
        NewEfxWhiteIN(anim, 30, 0);
    }
    else if (proc->timer == duration + 226)
    {
        StartSpellThing_MagicQuake(anim, 76, 10);
        StartSubSpell_efxNaglfarBG3(anim);
        NewEfxWhiteIN(anim, 0, 20);
        StartSubSpell_efxNaglfarOBJRockGyre(anim, 76);
    }
    else if (proc->timer == duration + 302)
    {
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            NewEfxRestWINH_(anim, 66, 1);
            NewEfxTwobaiRST(anim, 66);
            StartSubSpell_efxNaglfarBG4(anim);
            NewEfxALPHA(anim, 14, 32, 16, 0, 0);
            PlaySFX(0x3b0, 0x100, anim->xPosition, 1);
        }
        else
        {
            proc->timer = duration + 314;
        }
    }
    else if (proc->timer == duration + 314)
    {
        StartSubSpell_efxNaglfarOBJ2(anim, 5, 0);
    }
    else if (proc->timer == duration + 384)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
