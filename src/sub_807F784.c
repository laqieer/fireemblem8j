#include "global.h"
#include "proc.h"
void sub_807F784(void *p) { u16 *tp = (u16 *)((char *)p + 0x44); if (((*tp -= 1) << 16) == 0xFFFF0000) Proc_Break(p); }
