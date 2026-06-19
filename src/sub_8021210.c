#include "global.h"
#include "proc.h"
void sub_8021210(ProcPtr p) { if (p != 0) Proc_StartBlocking((const struct ProcCmd *)0x085C37D8, p); else Proc_Start((const struct ProcCmd *)0x085C37D8, (ProcPtr)3); }
