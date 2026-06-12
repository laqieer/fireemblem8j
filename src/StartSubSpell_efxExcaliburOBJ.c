#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxExcaliburOBJ[];

// clang-format on

//! FE8U = 0x08064B90
void StartSubSpell_efxExcaliburOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 40;

    scr = AnimScr_EfxExcalibur;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = proc->anim->xPosition;
    frontAnim->yPosition = proc->anim->yPosition;

    SpellFx_RegisterObjPal(Pal_ExcaliburSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_ExcaliburSprites, 32 * 4 * CHR_SIZE);

    return;
}
