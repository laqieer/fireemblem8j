#include "global.h"
#include "proc.h"
#include "efxbattle.h"

void EfxStatusCHGMain(struct ProcEfxHpBar * proc)
{
    if (++proc->timer == 0x11)
        Proc_Break(proc);
}
