#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHazymoon[] =
{
    PROC_NAME("efxHazymoon"),
    PROC_REPEAT(efxHazymoon_Loop_Main),
    PROC_END,
};

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxHazymoonBG_A(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_B(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_C(struct Anim * anim);
void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim);
void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim);

// clang-format on

//! FE8U = 0x0806028C
void StartSpellAnimEclipse(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxHazymoon, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080602C8
void efxHazymoon_Loop_Main(struct ProcEfx * proc)
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
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 80, 15, 16, 0, 0);
        StartSubSpell_efxHazymoonBG_A(proc->anim);
        StartSubSpell_efxHazymoonOBJ3(proc->anim);
        PlaySFX(0x138, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH_(anim, 43, 0);
    }
    else if (proc->timer == duration + 120)
    {
        StartSubSpell_efxHazymoonBG_B(anim);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x139, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 151)
    {
        StartSubSpell_efxHazymoonOBJ2(proc->anim);
    }
    else if (proc->timer == duration + 226)
    {
        PlaySFX(0x2E2, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        StartSubSpell_efxHazymoonBG_C(anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 270)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
