#include "global.h"
#include "proc.h"

extern u8 data_085C37D8[];
void sub_8021210(ProcPtr p) { if (p != 0) Proc_StartBlocking((const struct ProcCmd *)data_085C37D8, p); else Proc_Start((const struct ProcCmd *)data_085C37D8, (ProcPtr)3); }
