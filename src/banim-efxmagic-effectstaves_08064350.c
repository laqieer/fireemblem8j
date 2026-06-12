#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off

extern struct ProcCmd CONST_DATA ProcScr_efxSilence[];

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxMshieldBG(struct Anim * anim);
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim);
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim);

//! FE8U = 0x08063250
void efxMshield_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxMshieldBG(proc->anim);
        StartSubSpell_efxMshieldBGOBJ(anim);
        StartSubSpell_efxMshieldBGOBJ2(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 40)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 176)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 225)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
    }
    else if (proc->timer == duration + 230)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}
