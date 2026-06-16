#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern const void * EfxQuakePureVecs[];

ProcPtr NewEfxQuakePure(int index, int kind)
{
    struct ProcEfxQuake * proc = Proc_Start(ProcScr_efxQuakePure, PROC_TREE_3);

    proc->vec = (s16 *)EfxQuakePureVecs[index * 2];
    proc->quake_ui = (int)EfxQuakePureVecs[index * 2 + 1];

    proc->kind = kind;
    proc->timer = 0;

    return proc;
}
