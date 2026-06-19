#include "global.h"
#include "proc.h"
void sub_80708B4(void *p) { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if ((int)t > *(int *)((char *)p + 0x48)) { *tp = 0; Proc_Break(p); } }
