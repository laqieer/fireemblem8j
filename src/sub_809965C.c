#include "global.h"
#include "proc.h"
void FadeOutCgText(void) {
    ProcPtr proc = Proc_Find((const struct ProcCmd *)0x08A94430);
    if (proc)
        Proc_Goto(proc, 0);
}
