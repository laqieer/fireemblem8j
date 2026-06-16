#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxPurgeOBJ[];

void StartSubSpell_efxPurgeOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxPurgeOBJ, PROC_TREE_3);
    proc->anim = anim;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;
    SpellFx_RegisterObjPal(Pal_PurgeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_PurgeSprites, 32 * 4 * CHR_SIZE);
    return;
}
