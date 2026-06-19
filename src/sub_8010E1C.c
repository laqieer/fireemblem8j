#include "global.h"
int sub_8022200(void *);
int sub_8010E1C(void *p) { if (((*(u16 *)((char *)p + 0x3c) >> 2) & 1) == 0) sub_8022200(p); return 0; }
