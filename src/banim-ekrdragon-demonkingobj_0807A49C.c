#include "gbafe.h"



/* prototypes for same-file helpers called by this run */
void NewEkrSelfThunderBG(struct Anim *anim);

void EkrSelfThunderMain(struct ProcEfxDKfx *proc)
{
    int time = ++proc->timer;
    if (time == 0x1) {
        NewEkrSelfThunderBG(proc->anim);
        return;
    }

    if (time == 0x15)
        return;

    if (time == 0x46) {
        Proc_Break(proc);
        return;
    }
}
