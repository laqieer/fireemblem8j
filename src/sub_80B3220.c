#include "global.h"
#include "proc.h"
void BmBgfxSetLoopEN(int a) {
    int aa = (s8)a;
    ProcPtr p = Proc_Find((const struct ProcCmd *)0x08A9DD64);
    if (p)
        *((u8 *)p + 0x3a) = aa;
}
