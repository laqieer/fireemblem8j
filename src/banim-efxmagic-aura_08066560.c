#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxOuraBG[];
extern u16 * TsaArray_AuraBg1[];

//! FE8U = 0x08064EB0
void efxOura_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxOuraBG_A(anim);
        PlaySFX(0x2C1, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 14)
    {
        StartSubSpell_efxOuraBG_B(anim);
    }
    else if (proc->timer == 44)
    {
        PlaySFX(0x2C2, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 83)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 93)
    {
        StartSubSpell_efxOuraBG_C(anim);
    }
    else if (proc->timer == duration + 103)
    {
        PlaySFX(0x2C3, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        NewEfxALPHA(anim, 0, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 137)
    {
        StartSubSpell_efxOuraBG2(anim);
        StartSubSpell_efxOuraBGCOL(anim);
    }
    else if (proc->timer == duration + 144)
    {
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 154)
    {
        NewEfxRestWINH_(proc->anim, 95, 1);
        NewEfxTwobaiRST(proc->anim, 66);
        StartSubSpell_efxOuraBG3(anim);
        NewEfxALPHA(anim, 44, 12, 16, 0, 0);
    }
    else if (proc->timer == duration + 245)
    {

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x08065008
void StartSubSpell_efxOuraBG_A(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 1,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        -1
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806509C
void StartSubSpell_efxOuraBG_B(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 30,
        12,  3,
        13,  3,
        14,  3,
        15,  3,
        16, 20,
        17,  3,
        18,  1,
        19,  1,
        20,  1,
        21,  1,
        22,  1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}
