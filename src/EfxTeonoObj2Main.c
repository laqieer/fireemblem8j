#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void EfxTeonoObj2Main(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 17)
    {
        gEfxBgSemaphore--;
        gEfxTeonoState = 1;
        Proc_End(proc->seproc);
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}
