#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxCrimsonEyeOBJFinishPiece[];
extern s16 gEfxmagicCrimsoneye_0[];

// clang-format on

//! FE8U = 0x0806A138
void StartSubSpell_efxCrimsonEyeOBJFinishPiece(struct Anim * anim, int terminator, u8 c, s8 flag)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJFinishPiece, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 1;
    proc->terminator = terminator + 1;

    if (flag)
    {
        scr = AnimScr_EfxCrimsonEyeOBJFinishPiece1;
    }
    else
    {
        scr = AnimScr_EfxCrimsonEyeOBJFinishPiece2;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    proc->unk32 = gEfxmagicCrimsoneye_0[(c & 0xff) * 2];
    proc->unk3A = gEfxmagicCrimsoneye_0[((c & 0xff) * 2 + 1)];

    frontAnim->xPosition = Interpolate(INTERPOLATE_LINEAR, 120, (s16)proc->unk32, proc->timer, proc->terminator);
    frontAnim->yPosition = Interpolate(INTERPOLATE_LINEAR, 64, (s16)proc->unk3A, proc->timer, proc->terminator);

    return;
}
