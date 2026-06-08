#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxEvilEye[] =
{
    PROC_NAME("efxEvilEye"),
    PROC_REPEAT(efxEvilEye_Loop_Main),
    PROC_END,
};

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxEvilEyeBG(struct Anim * anim);
void StartSubSpell_efxEvilEyeBG2(struct Anim * anim);
void StartSubSpell_efxEvilEyeOBJ(struct Anim * anim, int terminator);

// clang-format on

//! FE8U = 0x08067798
void StartSpellAnimEvilEye(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxEvilEye, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080677D4
void efxEvilEye_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        PlaySFX(0x3C6, 0x100, anim->xPosition, 1);
        StartSubSpell_efxEvilEyeOBJ(anim, 60);
    }
    else if (proc->timer == duration + 26)
    {
        StartSubSpell_efxEvilEyeBG(anim);
    }
    else if (proc->timer == duration + 88)
    {
        StartSubSpell_efxEvilEyeBG2(anim);
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 116)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
