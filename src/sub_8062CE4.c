#include "global.h"
#include "proc.h"
void AnimDelete(void *);
void sub_8062CE4(void *p) { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if (t == *(s16 *)((char *)p + 0x30)) { (*(int *)0x0201774C)--; AnimDelete(*(void **)((char *)p + 0x60)); Proc_Break(p); } }
