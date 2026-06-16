#include "global.h"
#include "hardware.h"
#include "bmlib.h"

// JP region-different gfx dims + VRAM dest vs US (0xe->0x10/0xc, 0x060121C0->0x06011800)
void SaveMenu_LoadExtraSelectGfx(u8 param_1)
{
    int r4;
    void * r6;
    int r2;
    int i;
    void * r5;
    s16 z; // by decomp permuter

    if ((z = param_1) & 0x60)
    {
        r6 = (void *)0x06014000;
        r2 = 0x10;
        r4 = 2;
    }
    else if (param_1 & 0x10)
    {
        r6 = (void *)0x06014800;
        r2 = 0xc;
        r4 = 2;
    }

    r5 = (void *)(0x06011800);
    for (i = 0; i < r4; i++)
    {
        CpuFastCopy(
            r6,
            r5 + i * 0x400,
            r2 * 0x20
        );
        r6 += 0x400;
    }
}
