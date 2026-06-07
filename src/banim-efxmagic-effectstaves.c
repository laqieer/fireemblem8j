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



//! FE8U = 0x08062FA4
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x08062FBC
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk1;
    anim->pScrCurrent = AnimScr_EfxBerserk1;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08062FF8
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk2;
    anim->pScrCurrent = AnimScr_EfxBerserk2;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063034
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk3;
    anim->pScrCurrent = AnimScr_EfxBerserk3;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063070
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk4;
    anim->pScrCurrent = AnimScr_EfxBerserk4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630AC
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk5;
    anim->pScrCurrent = AnimScr_EfxBerserk5;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630E8
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk6;
    anim->pScrCurrent = AnimScr_EfxBerserk6;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063124
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk7;
    anim->pScrCurrent = AnimScr_EfxBerserk7;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063160
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk8;
    anim->pScrCurrent = AnimScr_EfxBerserk8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806319C
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk9;
    anim->pScrCurrent = AnimScr_EfxBerserk9;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080631D8
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_EfxBerserk10;
    anim->pScrCurrent = AnimScr_EfxBerserk10;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}
