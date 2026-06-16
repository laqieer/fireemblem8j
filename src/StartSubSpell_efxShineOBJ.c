#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxShineOBJ[];

void StartSubSpell_efxShineOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxShineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 70;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxShine, AnimScr_EfxShine, AnimScr_EfxShine, AnimScr_EfxShine);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;
    return;
}
