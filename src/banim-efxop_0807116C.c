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
extern struct ProcCmd ProcScr_efxopFireBG[];
extern struct ProcCmd ProcScr_efxopFireOBJ[];
extern struct ProcCmd ProcScr_efxopThunder[];
extern u16 * TsaArray_Fire_ClassReel[];

// clang-format on

//! FE8U = 0x0806EBBC
void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        9, 3,
        10, 3,
        11, 3,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopFireBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_Fire_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_FireSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_FireSpellBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806EC1C
void efxopFireBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
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

//! FE8U = 0x0806EC68
void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopFireOBJ, parent);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition = anim->xPosition - 8;
    }
    else
    {
        frontAnim->xPosition = anim->xPosition + 8;
    }

    frontAnim->yPosition = anim->yPosition + 8;

    frontAnim->xPosition += magicFx->xOffsetObj;
    frontAnim->yPosition += magicFx->yOffsetObj;

    CRSpell_RegisterObjPal(proc->anim, Pal_FireSpellSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FireSpellSprites);

    return;
}

//! FE8U = 0x0806ECE8
void efxopFireOBJ_Loop(struct ProcEfxOBJ * proc)
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

//! FE8U = 0x0806ED0C
void StartClassReelSpellAnimThunder(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopThunder, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}
