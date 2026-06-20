#include "global.h"
#include "proc.h"
void ConfigSysHandCursorShadowEnabled(int a) {
    int aa = (s8)a;
    ProcPtr p = Proc_Find((const struct ProcCmd *)0x08A9DB84);
    if (p)
        *((u8 *)p + 0x34) = aa;
}
