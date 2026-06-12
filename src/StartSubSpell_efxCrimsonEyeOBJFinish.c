#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxCrimsonEyeOBJFinish[];

// clang-format on

//! FE8U = 0x0806A3CC
void StartSubSpell_efxCrimsonEyeOBJFinish(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeOBJFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}
