#include "global.h"
#include "proc.h"
int Interpolate(int, int, int, int, int);
void sub_80708D8(void *p) { void *q = *(void **)((char *)p + 0x64); *(int *)((char *)q + 0x48) = Interpolate(0, 0x100, 0, *(s16 *)((char *)p + 0x2c), *(int *)((char *)p + 0x4c)); { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if (t > *(int *)((char *)p + 0x4c)) { *tp = 0; Proc_Break(p); } } }
