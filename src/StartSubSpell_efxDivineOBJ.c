#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDivineOBJ[];

// clang-format on

//! FE8U = 0x080601E0
void StartSubSpell_efxDivineOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 6;
    }
    else
    {
        frontAnim->xPosition += 6;
    }

    SpellFx_RegisterObjPal(Pal_DivineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DivineSprites, 32 * 4 * CHR_SIZE);

    return;
}
