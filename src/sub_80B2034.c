#include "global.h"
#include "proc.h"

extern u8 data_08A9DB84[];
void ConfigSysHandCursorShadowEnabled(int a) {
    int aa = (s8)a;
    ProcPtr p = Proc_Find((const struct ProcCmd *)data_08A9DB84);
    if (p)
        *((u8 *)p + 0x34) = aa;
}
