#include "global.h"
#include "proc.h"

extern u8 data_08A9DCD4[];
void SetSysBrownBoxWidth(int idx, int a) {
    int aa = (s8)a;
    ProcPtr p = Proc_Find((const struct ProcCmd *)data_08A9DCD4);
    if (p) {
        u8 * q = (u8 *)p + idx * 8;
        q[0x32] = aa;
    }
}
