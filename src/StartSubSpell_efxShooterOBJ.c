#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

extern struct ProcCmd ProcScr_efxShooterOBJ[];

void StartSubSpell_efxShooterOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxShooterOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_efxShooterOBJ_0, AnimScr_efxShooterOBJ_1, AnimScr_efxShooterOBJ_0, AnimScr_efxShooterOBJ_1);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 16;
    frontAnim->oam2Base &= OAM2_LAYER(3);
    if (GetAnimPosition(anim) == 1)
    {
        frontAnim->oam2Base |= OAM2_CHR(0x200) + OAM2_PAL(7);
    }
    else
    {
        frontAnim->oam2Base |= OAM2_CHR(0x300) + OAM2_PAL(9);
    }
    return;
}
