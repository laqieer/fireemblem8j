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
extern struct ProcCmd ProcScr_efxMshieldBGOBJ2[];

// clang-format on

//! FE8U = 0x08063428
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2, AnimScr_EfxMshield2);

    return;
}
