#include "global.h"

int sub_800C124(int p) { int q = *(int *)(p + 0x38); int a = *(s16 *)(q + 6); u16 *d = (u16 *)0x03005270; d[1] = *(u16 *)(q + 4); d[2] = a; return 0; }
