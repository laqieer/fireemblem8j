#include "global.h"

void ClearWmTextVram(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        CpuFastFill(0, (void *)(0x06014000 + i * 0x400), 0x360);
    }

    return;
}
