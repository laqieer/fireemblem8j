#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxFenrirOBJ2[];

// clang-format on

//! FE8U = 0x08060E90
void StartSubSpell_efxFenrirOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFenrirOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 0;

    SpellFx_RegisterObjPal(Pal_FenrirSprites_B, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FenrirSprites, 32 * 4 * CHR_SIZE);

    return;
}
