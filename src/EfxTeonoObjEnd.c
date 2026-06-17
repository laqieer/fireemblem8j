#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"




void EfxTeonoObjEnd(struct ProcEfxMagicOBJ * proc)
{
    gEkrbattle_4 = 0;
    Proc_End(proc->seproc);
    NewEfxTeonoOBJ2(proc->anim);
    Proc_Break(proc);
}
