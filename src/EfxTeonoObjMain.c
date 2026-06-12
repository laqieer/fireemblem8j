#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void EfxTeonoObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);

        if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        {
            gEfxTeonoState = 1;
            Proc_End(proc->seproc);
            Proc_End(proc);
        }
        else
        {
            Proc_Break(proc);
        }
    }
}
