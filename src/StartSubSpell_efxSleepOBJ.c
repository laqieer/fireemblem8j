#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxSleepOBJ[];

void StartSubSpell_efxSleepOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSleepOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1, AnimScr_EfxSleepOBJ1);
    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);
    return;
}
