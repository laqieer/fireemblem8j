#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxopLiveALPHA[];
extern struct ProcCmd ProcScr_efxopLiveBG[];
extern struct ProcCmd ProcScr_efxopLiveBGCOL[];
extern struct ProcCmd ProcScr_efxopLiveOBJ[];
extern u16 * gEfxop_0[];

// clang-format on

//! FE8U = 0x0806EFB8
void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 62,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLiveBG, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = gEfxop_0;

    CRSpell_RegisterBgGfx(anim, Img_HealSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F00C
void efxopLiveBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 0);
    }
    else
    {
        if (ret == -1)
        {
            ClearCRSpellBgTmBuf(proc->anim);
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format on

//! FE8U = 0x0806F058
void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 4,
        4, 4,
        5, 4,
        6, 4,
        7, 4,
        8, 4,
        9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
        15, 5,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopLiveBGCOL, PROC_TREE_3);
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_HealSpellBg;

    return;
}

//! FE8U = 0x0806F08C
void efxopLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        CRSpell_RegisterBgPal(proc->anim, pal + ret * 0x10);
    }
    else
    {
        if (ret == -1)
        {
            EndActiveClassReelBgColorProc();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format on

//! FE8U = 0x0806F0CC
void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused)
{
    struct ProcEfxALPHA * proc = Proc_Start(ProcScr_efxopLiveALPHA, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = timer;
    proc->unk2E = c;

    proc->unk29 = d;

    return;
}

//! FE8U = 0x0806F0FC
void efxopLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    if (--proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0806F118
void efxopLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int bldA;

    if (proc->timer > proc->unk2E)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->unk29 == 0)
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
    }
    else
    {
        bldA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
    }

    SetBlendAlpha(bldA, 16);

    proc->timer++;

    return;
}

// clang-format on

//! FE8U = 0x0806F184
void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopLiveOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    scr = AnimScr_EfxLiveOBJ1;
    frontAnim = CRSpellCreateFrontAnim(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    CRSpell_RegisterObjPal(proc->anim, Pal_HealSprites_Sparkles);
    CRSpell_RegisterObjGfx(proc->anim, Img_HealSprites_Sparkles);

    return;
}
