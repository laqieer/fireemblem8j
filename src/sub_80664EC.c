#include "global.h"

void Proc_Break(void *); void sub_80664EC(void *p) { void *q = *(void **)((char *)p + 0x60); *(void **)((char *)q + 0x24) = (void *)0x08763AB0; *(void **)((char *)q + 0x20) = (void *)0x08763AB0; *(u16 *)((char *)q + 6) = 0; Proc_Break(p); }
