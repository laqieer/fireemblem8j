#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFenrirOBJ[];

// clang-format on

//! FE8U = 0x08060C18
void StartSubSpell_efxFenrirOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3, AnimScr_EfxFenrir3);

    SpellFx_RegisterObjPal(Pal_FenrirSprites_A, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}
