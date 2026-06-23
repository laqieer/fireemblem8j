#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxMaohFlashEyeLOBJ2[];
/* JP-specific AnimScr roots (UNNAMED in sym_jp) */
extern u32 AnimScr_MaohFlashEyeLOBJ2_0[];
extern u32 AnimScr_MaohFlashEyeLOBJ2_1[];

// clang-format on

//! FE8U = 0x08066DB0
void StartSubSpell_efxMaohFlashEyeLOBJ2(struct Anim * anim, int terminator, s16 x, s16 y)
{
    register int a asm("r0");
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    struct Anim * ref;

    u32 * scr;
    // clang-format off
    u32 * gUnknown_080DE8C0[2] =
    {
        AnimScr_MaohFlashEyeLOBJ2_0,
        AnimScr_MaohFlashEyeLOBJ2_1,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashEyeLOBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DE8C0[pos];

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    ref = frontAnim;

    if (pos != 0)
    {
        a = (efxMaohFlash_GetSideXOffset(pos) + DISPLAY_WIDTH);
        a = a - x;
    }
    else
    {
        a = x + efxMaohFlash_GetSideXOffset(0);
    }

    ref->xPosition = frontAnim->xPosition = a;
    proc->anim2->yPosition = frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}
