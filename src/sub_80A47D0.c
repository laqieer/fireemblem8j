#include "global.h"
#include "proc.h"
#include "hardware.h"

struct PalFlashProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2a);
    /* 2A */ u16 timer;
    /* 2C */ u16 colors[15];
};

void sub_80A47D0(struct PalFlashProc * proc)
{
    int i;
    u16 * out = &gPaletteBuffer[0xA1];
    int delta;

    proc->timer--;
    delta = (u16) proc->timer >> 1;

    for (i = 0; i < 15; i++)
    {
        int r = (proc->colors[i] & RED_MASK) + delta;
        int g = ((proc->colors[i] & GREEN_MASK) >> 5) + delta;
        int b = ((proc->colors[i] & BLUE_MASK) >> 10) + delta;

        if (r > 0x1f)
            r = 0x1f;
        if (g > 0x1f)
            g = 0x1f;
        if (b > 0x1f)
            b = 0x1f;

        *out++ = (r & 0x1f) + ((g & 0x1f) << 5) + ((b & 0x1f) << 10);
    }

    EnablePaletteSync();

    if (proc->timer == 0)
        Proc_Break(proc);
}
