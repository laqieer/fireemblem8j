#include "global.h"
#include "proc.h"
void SetSysBrownBoxWidth(int idx, int a) {
    int aa = (s8)a;
    ProcPtr p = Proc_Find((const struct ProcCmd *)0x08A9DCD4);
    if (p) {
        u8 * q = (u8 *)p + idx * 8;
        q[0x32] = aa;
    }
}
