#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxSuperdruidOBJ2[];

// clang-format on

//! FE8U = 0x080655C4
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSuperdruidOBJ2, PROC_TREE_3);
    proc->anim = anim;

    scr = AnimScr_efxSuperdruidOBJ;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = anim->xPosition;
    frontAnim->yPosition = anim->yPosition;

    SpellFx_RegisterObjGfx(Img_Banim_18, 32 * 4 * CHR_SIZE);
    SpellFx_RegisterObjPal(Pal_efxSuperdruidOBJ, PLTT_SIZE_4BPP);

    return;
}
