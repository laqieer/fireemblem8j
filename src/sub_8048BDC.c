#include "global.h"

void PrintDebugStringAsOBJ(int a, int b, const char * str);

extern const u8 gUnk_080DEEE8[];

void sub_8048BDC(void)
{
    PrintDebugStringAsOBJ(8, 0x10, (const char *)((const u8 *)gUnk_080DEEE8 + 0x18));
}
