#include "global.h"
#include "gbafe.h"

void EkrDK_WaitForFadeOut(struct ProcEkrDragon * proc)
{
    struct ProcEfxDKfx *fxproc = proc->fxproc;
    if (fxproc->finished == true) {
        Proc_End(fxproc);
        Proc_Break(proc);
    }
}
