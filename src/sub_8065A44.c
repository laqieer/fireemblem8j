#include "global.h"
#include "proc.h"
void sub_8065A44(void *p) { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if (t > *(s16 *)((char *)p + 0x2e)) Proc_Break(p); }
