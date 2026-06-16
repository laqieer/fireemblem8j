#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxSleepOBJ2[];

void StartSubSpell_efxSleepOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSleepOBJ2, PROC_TREE_3);
    proc->anim = anim;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2, AnimScr_EfxSleepOBJ2);
    proc->anim2 = frontAnim;
    frontAnim->yPosition -= 8;
    return;
}
