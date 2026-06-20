#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "bmlib.h"
void sub_8068850(struct ProcEfxBG * proc) {
    int ref = Interpolate(0, 0, 0x10, proc->timer, proc->terminator);
    CpuFastSet((const void *)0x020228A8, (void *)0x020165C8, 0x100);
    EfxPalWhiteInOut((u16 *)0x020165C8, 0, 0x20, ref);
    proc->timer++;
    if (proc->timer > proc->terminator) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
