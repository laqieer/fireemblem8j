#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxSilenceOBJ[];

// clang-format on

//! FE8U = 0x08062608
void StartSubSpell_efxSilenceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ, AnimScr_EfxSilenceOBJ);

    SpellFx_RegisterObjPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SilenceSprites, 32 * 4 * CHR_SIZE);

    return;
}
