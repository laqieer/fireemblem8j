#include "global.h"
#include "proc.h"

extern u8 data_08A94430[];
void FadeOutCgText(void) {
    ProcPtr proc = Proc_Find((const struct ProcCmd *)data_08A94430);
    if (proc)
        Proc_Goto(proc, 0);
}
