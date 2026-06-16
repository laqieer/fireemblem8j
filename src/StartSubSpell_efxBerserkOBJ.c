#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

extern struct ProcCmd ProcScr_efxBerserkOBJ[];

void StartSubSpell_efxBerserkOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxBerserkOBJ, PROC_TREE_3);
    proc->anim = anim;
    GetAnimAnotherSide(anim);
    scr = FramScr_Unk5D4F90;
    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);
    return;
}
