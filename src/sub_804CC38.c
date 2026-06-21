#include "global.h"
#include "proc.h"

extern u8 data_085D4858[];
void sub_804CC38(ProcPtr p) { if (Proc_Find((const struct ProcCmd *)data_085D4858) == 0) Proc_Break(p); }
