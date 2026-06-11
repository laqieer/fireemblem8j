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
extern struct ProcCmd ProcScr_efxopLive[];
extern struct ProcCmd ProcScr_efxopThunderBG[];
extern struct ProcCmd ProcScr_efxopThunderBGCOL[];
extern struct ProcCmd ProcScr_efxopThunderOBJ[];
extern u16 * TsaArray_Thunder_ClassReel[];

// clang-format on

//! FE8U = 0x0806ED54
void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 4,
        1, 40,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopThunderBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Thunder_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_ThunderSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_ThunderSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EDB0
void efxopThunderBG_Loop(struct ProcEfxBG * proc)
{
    u16 chr = 0;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(proc->anim);

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);

        if (ret == 0)
        {
            chr = magicFx->bgChr + 31;
        }

        if (ret == 1)
        {
            chr = magicFx->bgChr + 80;
        }

        FillBGRect(magicFx->bgTmBuf + 0x1E, 2, 20, magicFx->bgPalId, chr);
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

//! FE8U = 0x0806EE34
void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 4,
        1, 4,
        2, 2,
        3, 2,
        4, 20,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopThunderBGCOL, PROC_TREE_3);
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_ThunderSpellBg;

    return;
}

//! FE8U = 0x0806EE68
void efxopThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
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

//! FE8U = 0x0806EEA8
void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopThunderOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition + 56;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition - 56;
    }

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    CRSpell_RegisterObjPal(proc->anim, Pal_BoltingSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_BoltingSprites);

    return;
}

//! FE8U = 0x0806EF24
void efxopThunderOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x0806EF48
void StartClassReelSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLive, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    return;
}
