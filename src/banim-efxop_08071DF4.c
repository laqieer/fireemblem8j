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
extern u16 * ImgArray_Stone_ClassReel[];
extern struct ProcCmd ProcScr_efxopStone[];
extern struct ProcCmd ProcScr_efxopStoneBG[];
extern struct ProcCmd ProcScr_efxopStoneOBJ[];
extern u16 * TsaArray_Stone_ClassReel[];

// clang-format on

//! FE8U = 0x0806F844
void StartClassReelSpellAnimStone(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopStone, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F864
void efxopStone_Loop_A(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopStoneOBJ(proc->anim, proc);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x0806F87C
void efxopStone_Loop_B(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopStoneBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format on

//! FE8U = 0x0806F894
void StartCRSubSpell_efxopStoneBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 4,
        1, 4,
        2, 4,
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
        15, 4,
        16, 4,
        17, 4,
        18, 4,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopStoneBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Stone_ClassReel;
    proc->img = ImgArray_Stone_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_StoneBg);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F8F0
void efxopStoneBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));

        if (ret == 17)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_0, PLTT_SIZE_4BPP);
        }

        if (ret == 18)
        {
            SpellFx_RegisterBgPal(Pal_StoneBg_1, PLTT_SIZE_4BPP);
        }
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

//! FE8U = 0x0806F968
void StartCRSubSpell_efxopStoneOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct AnimMagicFxBuffer * unused = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopStoneOBJ, parent);

    proc->anim = anim;
    proc->timer = 0;

    scr = AnimScr_EfxStone;
    frontAnim = CRSpellCreateFrontAnim(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition += 12;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;
    frontAnim->oam2Base |= OAM2_LAYER(3);

    AnimSort();

    CRSpell_RegisterObjPal(proc->anim, Pal_StoneSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_StoneSprites);

    return;
}
