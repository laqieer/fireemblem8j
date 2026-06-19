#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"




void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)(*(s16*)((char*)proc+0x2e)))
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
