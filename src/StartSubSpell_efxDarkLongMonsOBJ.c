#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkLongMonsOBJ[];

// clang-format on

//! FE8U = 0x0806B2C0
void StartSubSpell_efxDarkLongMonsOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 188;

    scr = AnimScr_efxDarkLongMonsOBJ;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(proc->anim) == 0)
    {
        frontAnim->xPosition = 200;
    }
    else
    {
        frontAnim->xPosition = 40;
    }

    frontAnim->yPosition = 32;

    SpellFx_RegisterObjPal(Pal_efxDarkLongMonsOBJ, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_Banim_16, 32 * 4 * CHR_SIZE);

    return;
}
