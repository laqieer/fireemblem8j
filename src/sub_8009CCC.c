#include "global.h"
#include "proc.h"
void sub_8009CCC(ProcPtr p) { u8 *g = (u8 *)0x0202BCEC; if (g[0x14] & 0x80) Proc_Goto(p, 9); else Proc_Goto(p, 8); }
