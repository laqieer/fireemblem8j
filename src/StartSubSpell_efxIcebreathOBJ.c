#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIcebreathOBJ[];

// clang-format on

//! FE8U = 0x0805D444
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scrA;
    u32 * scrB;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIcebreathOBJ, PROC_TREE_3);
    proc->anim = anim;

    scrB = AnimScr_IcebreathOBJ_Right;
    scrA = AnimScr_IcebreathOBJ_Left;
    frontAnim = EfxCreateFrontAnim(anim, scrA, scrB, scrA, scrB);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 32;
    }
    else
    {
        frontAnim->xPosition -= 32;
    }

    SpellFx_RegisterObjPal(Pal_IceBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}
