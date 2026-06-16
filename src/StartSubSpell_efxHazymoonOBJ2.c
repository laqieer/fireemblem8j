#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxHazymoonOBJ2[];

void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ2, PROC_TREE_3);
    proc->anim = anim;
    otherAnim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(otherAnim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
    proc->anim2 = frontAnim;
    frontAnim->oam2Base &= ~(0xc00);
    frontAnim->oam2Base |= 0x400;

    if (GetAnimPosition(otherAnim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 16;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 16;
    }

    return;
}
