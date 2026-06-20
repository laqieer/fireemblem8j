#include "global.h"
#include "uimenu.h"
void DrawUiFrame(u16 *, int, int, int, int, int, int);
void BG_EnableSyncByMask(int);
void sub_80494C8(void *p) { DrawUiFrame((u16 *)0x020234A8, 2, 9, 0x10, 6, 0, 0); BG_EnableSyncByMask(2); *(u16 *)((char *)p + 0x68) = 0; }
