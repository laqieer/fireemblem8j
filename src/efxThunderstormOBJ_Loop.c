#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"




void efxThunderstormOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2 = EfxCreateFrontAnim(proc->anim, AnimScr_EfxThunderstormOBJ, AnimScr_EfxThunderstormOBJ, AnimScr_EfxThunderstormOBJ, AnimScr_EfxThunderstormOBJ);

    SpellFx_RegisterObjPal(Pal_BoltingSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}
