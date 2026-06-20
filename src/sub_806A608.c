#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void efxDrzDrakbreathBG_Loop(struct ProcEfxBG * proc) {
    proc->timer++;
    if (proc->timer == proc->terminator) {
        gEfxBgSemaphore--;
        AnimDelete(*(struct Anim **)((char *)proc + 0x60));
        Proc_Break(proc);
    }
}
