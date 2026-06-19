#include "global.h"
int sub_800C3AC(int p) { int q = *(int *)(p + 0x38); int a = *(s16 *)(q + 4); int b = *(s16 *)(q + 6); int *d = (int *)0x03005270; d[2] = a << 8; d[3] = b << 8; return 0; }
