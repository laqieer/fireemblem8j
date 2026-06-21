#include "global.h"

extern u8 data_085775CC[];

void Proc_Break(void *); void sub_8049638(void *p) { void *o = *(void **)data_085775CC; if (*(u16 *)((char *)o + 8) & 9) Proc_Break(p); }
