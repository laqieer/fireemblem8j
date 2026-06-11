#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

extern EWRAM_DATA ProcPtr gpActiveClassReelSpellProc;
extern EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc;

/* prototypes for same-file helpers called by this run */
void CRSpell_RegisterObjGfx(struct Anim * anim, void * src);
void CRSpell_RegisterObjPal(struct Anim * anim, u16 * src);

void efxopMistyrainOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806F4C0
void efxopMistyrainOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj1;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_Orb);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F4F8
void efxopMistyrainOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj2;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_Tendrils);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F530
void efxopMistyrainOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj3;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;

    CRSpell_RegisterObjPal(proc->anim, Pal_FluxAnimSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FluxAnimSprites_SigilVoid);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F568
void efxopMistyrainOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    u32 * scr = AnimScr_EfxMistyRainObj4;

    anim->pScrStart = scr;
    anim->pScrCurrent = scr;
    anim->timer = 0;
    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806F594
void efxopMistyrainOBJ2_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        u32 * scr = AnimScr_EfxMistyRainObj5;

        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}
