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
extern u16 * ImgArray_EvilEye_ClassReel[];
extern u16 * PalArray_EvilEye_ClassReel[];
extern struct ProcCmd ProcScr_efxopEvilEye[];
extern struct ProcCmd ProcScr_efxopEvilEyeBG[];
extern struct ProcCmd ProcScr_efxopEvilEyeOBJ[];
extern u16 * TsaArray_EvilEye_ClassReel[];

// clang-format on

//! FE8U = 0x0806F6B4
void StartClassReelSpellAnimEvilEye(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopEvilEye, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F6D4
void efxopEvilEye_Loop_A(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopEvilEyeOBJ(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F6EC
void efxopEvilEye_Loop_B(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopEvilEyeBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format on

//! FE8U = 0x0806F704
void StartCRSubSpell_efxopEvilEyeBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        4, 3,
        5, 3,
        6, 3,
        7, 3,
        8, 3,
        9, 3,
        10, 3,
        11, 3,
        12, 3,
        13, 3,
        14, 3,
        15, 3,
        16, 3,
        17, 3,
        18, 3,
        19, 3,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopEvilEyeBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EvilEye_ClassReel;
    proc->img = ImgArray_EvilEye_ClassReel;
    proc->pal = PalArray_EvilEye_ClassReel;

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F75C
void efxopEvilEyeBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_RegisterBgPal(proc->anim, *(pal + ret));
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

//! FE8U = 0x0806F7C0
void StartCRSubSpell_efxopEvilEyeOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * unused = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopEvilEyeOBJ, parent);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_Banim_1, AnimScr_Banim_0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 24;

    CRSpell_RegisterObjPal(proc->anim, Pal_Banim_6);
    CRSpell_RegisterObjGfx(proc->anim, Img_Banim_15);

    return;
}
