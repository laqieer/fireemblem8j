#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805E968
void efxThunderstormOBJ_End(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);

    gEfxBgSemaphore--;
    Proc_Break(proc);

    return;
}
