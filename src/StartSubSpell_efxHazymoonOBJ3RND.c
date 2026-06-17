#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"



extern struct ProcCmd  ProcScr_efxHazymoonOBJ3RND[];

void StartSubSpell_efxHazymoonOBJ3RND(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3RND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}
