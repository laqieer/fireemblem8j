#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"

void NewEkrChienCHR(struct Anim * anim)
{
    struct ProcEkrChienCHR * proc;
    proc = Proc_Start(gProc_ekrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}
