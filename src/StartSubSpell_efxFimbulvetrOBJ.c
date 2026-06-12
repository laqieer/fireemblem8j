#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFimbulvetrOBJ[];

// clang-format on

//! FE8U = 0x0805E430
void StartSubSpell_efxFimbulvetrOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1);
    proc->anim2->xPosition += 24;

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FimbulvetrSprites_Snow, 32 * 4 * CHR_SIZE);

    return;
}
