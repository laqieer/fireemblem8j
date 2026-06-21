#include "global.h"

extern u8 data_08763ABC[];

void Proc_Break(void *); void sub_8066508(void *p) { void *q = *(void **)((char *)p + 0x60); *(void **)((char *)q + 0x24) = (void *)data_08763ABC; *(void **)((char *)q + 0x20) = (void *)data_08763ABC; *(u16 *)((char *)q + 6) = 0; Proc_Break(p); }
