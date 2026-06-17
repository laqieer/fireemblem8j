#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"




void NewEfxTeonoOBJ2(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);
}
