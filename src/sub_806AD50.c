#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void efxNaglfarOBJ_Loop(struct ProcEfxBG * proc) {
    proc->timer++;
    if (proc->timer == proc->terminator) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
