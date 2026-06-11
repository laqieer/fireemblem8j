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
extern u16 * ImgArray_Flux_ClassReel[];
extern u16 * ImgArray_Light_ClassReel[];
extern u16 * PalArray_Light_ClassReel[];
extern struct ProcCmd ProcScr_efxopLightning[];
extern struct ProcCmd ProcScr_efxopLightningBG[];
extern struct ProcCmd ProcScr_efxopMistyrainBG[];
extern struct ProcCmd ProcScr_efxopMistyrainOBJ[];
extern struct ProcCmd ProcScr_efxopMistyrainOBJ2[];
extern u16 * TsaArray_Flux_ClassReel[];
extern u16 * TsaArray_Light_ClassReel[];

// clang-format on

//! FE8U = 0x0806F210
void StartClassReelSpellAnimLight(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLightning, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}

//! FE8U = 0x0806F230
void efxopLightning_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLightningBG(proc->anim, proc);
    Proc_Break(proc);
    return;
}

// clang-format on

//! FE8U = 0x0806F248
void StartCRSubSpell_efxopLightningBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        0, 7,
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
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLightningBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Light_ClassReel;
    proc->tsar = TsaArray_Light_ClassReel;

    proc->img = ImgArray_Light_ClassReel;
    proc->pal = PalArray_Light_ClassReel;

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F2A0
void efxopLightningBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_RegisterBgPal(proc->anim, *(pal + ret));
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);
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

//! FE8U = 0x0806F304
void StartCRSubSpell_efxopMistyrainBG(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        9, 2,
        10, 2,
        11, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopMistyrainBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Flux_ClassReel;
    proc->tsar = TsaArray_Flux_ClassReel;
    proc->img = ImgArray_Flux_ClassReel;

    proc->terminator = 0;

    CRSpell_RegisterBgPal(anim, Pal_Banim_1);

    if (GetAnimPosition(proc->anim) == 0)
    {
        gLCDControlBuffer.bgoffset[BG_1].x += 4;
    }
    else
    {
        gLCDControlBuffer.bgoffset[BG_1].x -= 4;
    }

    gLCDControlBuffer.bgoffset[BG_1].y += 8;

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    return;
}

//! FE8U = 0x0806F38C
void StartCRSubSpell_efxopMistyrainBG_2(struct Anim * anim, struct ProcEfx * parent)
{
    // clang-format off
    static const u16 frames[] =
    {
        12, 6,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        33, 2,
        34, 2,
        35, 2,
        36, 2,
        37, 2,
        38, 2,
        39, 2,
        40, 2,
        -1,
    };
    // clang-format on

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopMistyrainBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Flux_ClassReel;
    proc->tsar = TsaArray_Flux_ClassReel;
    proc->img = ImgArray_Flux_ClassReel;

    proc->terminator = 1;

    CRSpell_RegisterBgPal(anim, Pal_Banim_2);

    magicFx->resetCallback();

    SetCRSpellBgPosition(proc->anim, magicFx);

    SetBlendAlpha(10, 7);

    return;
}

//! FE8U = 0x0806F3F8
void efxopMistyrainBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;

        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_WriteBgMap(proc->anim, proc->terminator, *(tsaL + ret), 1);
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

//! FE8U = 0x0806F450
void StartCRSubSpell_efxopMistyrainOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopMistyrainOBJ, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    proc->anim2 = CRSpellCreateFrontAnim(anim, 1, scr, scr);

    return;
}

// clang-format on

//! FE8U = 0x0806F47C
struct ProcEfxOBJ * StartCRSubSpell_efxopMistyrainOBJ2(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;
    u32 * scr;

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopMistyrainOBJ2, parent);
    proc->anim = anim;

    scr = FramScr_Unk5D4F90;
    frontAnim = CRSpellCreateFrontAnim(anim, 0, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition -= 56;
    frontAnim->yPosition -= 4;

    return proc;
}
