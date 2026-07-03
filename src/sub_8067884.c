#include "global.h"

#include "proc.h"

// JP-area proc tile-fill/fade animator. Field offsets from gbadisasm oracle.
struct FillFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
};

extern int Interpolate(int a, int b, int c, int d, int e);
extern void EfxPalWhiteInOut(void * dst, int b, int c, int color);

extern u8 gBuf_020165C8[];
extern u8 gBuf_020228A8[];
extern int gCounter_0201774C;

void sub_8067884(struct FillFadeProc * proc)
{
    int color;
    u16 m;

    if (proc->unk_2c > proc->unk_2e)
        m = proc->unk_2e;
    else
        m = proc->unk_2c;

    color = Interpolate(0, 0, 0x10, m, proc->unk_2e);
    CpuFastSet(gBuf_020165C8, gBuf_020228A8, 0x100);
    EfxPalWhiteInOut(gBuf_020228A8, 0, 0x20, color);

    proc->unk_2c++;

    if (proc->unk_2c > proc->unk_30)
    {
        CpuFastSet(gBuf_020165C8, gBuf_020228A8, 0x100);
        gCounter_0201774C -= 1;
        Proc_Break(proc);
    }
}
