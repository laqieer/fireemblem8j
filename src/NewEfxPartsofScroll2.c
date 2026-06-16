#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_EfxPartsofScroll2[];

ProcPtr NewEfxPartsofScroll2(void)
{
    struct ProcEfx * proc =
        Proc_Start(ProcScr_EfxPartsofScroll2, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    return proc;
}
