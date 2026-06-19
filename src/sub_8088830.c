#include "global.h"

void SetEventSlotC(int); int sub_8088830(void) { u8 *p = (u8 *)0x0202BCEC; p[0x1b] = 2; SetEventSlotC(0xBD7); return 0x17; }
