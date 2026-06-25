#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ekrbattle.h"
struct ScrollSinProc { PROC_HEADER; STRUCT_PAD(0x2A,0x2C); u16 timer; s16 phase; STRUCT_PAD(0x30,0x44); int limit; int amp; };
void sub_80707BC(struct ScrollSinProc * proc)
{
    u16 * dst;
    int amp;
    u32 i;
    if (gEkrBg1ScrollFlip == 0)
        dst = gpBg1ScrollOffsetList2;
    else
        dst = gpBg1ScrollOffsetList1;
    for (i = 0; i <= 0x4F; i++)
    {
        s16 s = gSinLookup[((i << 1) + proc->phase) & 0xFF];
        u16 v = (s >> 9) + 4;
        amp = proc->amp;
        *dst++ = (amp * v) >> 8;
    }
    proc->phase += 2;
    if ((s16)(++proc->timer) == proc->limit)
        Proc_End(proc);
}
