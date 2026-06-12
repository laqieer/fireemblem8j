#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiOBJFall[];

// clang-format on

//! FE8U = 0x08065DA4
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJFall, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}
