#include "global.h"
#include "proc.h"

extern u8 data_085775CC[];
void sub_80D0DB4(ProcPtr p) { void *o = *(void **)data_085775CC; if (*(u16 *)((char *)o + 8) & 0xa) Proc_Goto(p, 0); }
