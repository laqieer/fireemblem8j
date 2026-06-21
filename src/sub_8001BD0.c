#include "global.h"

extern u8 data_085775CC[];
void SoftReset(u32);
void sub_8001BD0(void) { u16 keys = *(u16 *)(*(int *)data_085775CC + 4); if (keys == 0x303) SoftReset(0xFF); else if (keys == 0xf) SoftReset(0xFF); }
