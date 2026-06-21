#include "global.h"
#include "proc.h"

extern u8 data_085D4890[];
void sub_804CC58(ProcPtr p) { if (Proc_Find((const struct ProcCmd *)data_085D4890) == 0) Proc_Break(p); }
