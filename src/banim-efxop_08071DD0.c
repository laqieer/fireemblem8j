#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

//! FE8U = 0x0806F820
void efxopEvilEyeOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 60)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
