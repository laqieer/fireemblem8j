#include "global.h"
#include "proc.h"
void GmapAutoMu_WaitInitialDelay(void * proc) {
    s16 * delay = (s16 *)((char *)proc + 0x3c);
    *delay -= 1;
    if (*delay < 1)
        Proc_Break(proc);
}
