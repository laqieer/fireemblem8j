#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format on

extern struct ProcCmd ProcScr_efxResireRST[];

//! FE8U = 0x0805F838
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = c;
    proc->efxproc = efxproc;

    return;
}
