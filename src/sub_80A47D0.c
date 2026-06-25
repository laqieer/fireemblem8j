#include "global.h"
#include "proc.h"
#include "hardware.h"

struct Proc80A47D0
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u16 timer;
    /* 2C */ u16 colors[15];
};

extern u16 gPalBuf_20229EA[];

void sub_80A47D0(struct Proc80A47D0* proc)
{
    u16* dst = gPalBuf_20229EA;
    int amt;
    int i;
    int r, g, b;
    u16 c;

    proc->timer--;
    amt = (u16)proc->timer >> 1;

    for (i = 0; i <= 0xE; i++)
    {
        c = proc->colors[i];
        r = (c & 0x1F) + amt;
        g = ((c & 0x3E0) >> 5) + amt;
        b = ((c & 0x7C00) >> 0xA) + amt;

        if (r > 0x1F)
            r = 0x1F;
        if (g > 0x1F)
            g = 0x1F;
        if (b > 0x1F)
            b = 0x1F;

        *dst = (r & 0x1F) + ((g & 0x1F) << 5) + ((b & 0x1F) << 0xA);
        dst++;
    }

    EnablePaletteSync();

    if (proc->timer == 0)
        Proc_Break(proc);
}
