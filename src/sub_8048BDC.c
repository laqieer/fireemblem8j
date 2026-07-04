#include "global.h"

void PrintDebugStringAsOBJ(int a, int b, const char * str);

void sub_8048BDC(void)
{
    PrintDebugStringAsOBJ(8, 0x10, (const char *)0x080DEF00);
}
