#include "global.h"
#include "gbafe.h"

void EkrdragonDemonking_OnEnd(struct ProcEfxDKfx * proc)
{
    proc->finished = true;
    Proc_Break(proc);
}
