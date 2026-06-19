#include "global.h"
#include "proc.h"
void AnimDelete(void *);
void sub_805E130(void *p) { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if (t > *(s16 *)((char *)p + 0x2e)) { AnimDelete(*(void **)((char *)p + 0x60)); (*(int *)0x0201774C)--; Proc_Break(p); } }
