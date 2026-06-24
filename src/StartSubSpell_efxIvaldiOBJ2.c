#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiOBJ2[];
/* JP-specific AnimScr roots (UNNAMED in sym_jp) = fe8u AnimScr_EfxIvald2_L/R */
extern u32 AnimScr_EfxIvald2_L[];
extern u32 AnimScr_EfxIvald2_R[];

// clang-format on

u32 * const gEfxmagicIvaldi_0[2] = {
    AnimScr_EfxIvald2_L,
    AnimScr_EfxIvald2_R,
};

//! FE8U = 0x08066390
void StartSubSpell_efxIvaldiOBJ2(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    const u32 * a[2], * scr;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    void * labels[2];

    labels[0] = &&label;
    a[0] = gEfxmagicIvaldi_0[0];
    a[1] = gEfxmagicIvaldi_0[1];

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJ2, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

label:
    switch (kind)
    {
        case 0:
        default:
            scr = a[0];
            break;

        case 1:
            scr = a[1];
            break;
    }

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~0xC00;
    frontAnim->oam2Base |= 0x400;

    return;
}
