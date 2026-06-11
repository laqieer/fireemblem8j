#include "global.h"
#include "gbafe.h"

void EkrDKStartBaseHide(struct ProcEkrDragon * proc)
{
    NewEkrDragonBaseHide(proc->anim);
    Proc_Break(proc);
}
