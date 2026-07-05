#include "global.h"

struct GameRankProc
{
    /* 00 */ u8 _pad00[0x2c];
    /* 2C */ int unk2c;
    /* 30 */ int unk30;
    /* 34 */ u8 _pad34[0x3a - 0x34];
    /* 3A */ u8 ranks[6];
    /* 40 */ u8 unk40[6];
    /* 46 */ u8 unk46[6];
    /* 4C */ u16 unk4c[6];
};

struct RankRamUnk
{
    /* 00 */ u32 unk00;
    /* 04 */ u32 unk04;
    /* 08 */ u8 _pad08[0x14 - 0x08];
    /* 14 */ u8 flags14;
    /* 15 */ u8 _pad15[0x41 - 0x15];
    /* 41 */ u8 flags41;
};

#define gUnk_0202BCEC (*(struct RankRamUnk *)0x0202BCEC)

extern void sub_80BCD5C(int a, struct GameRankProc *proc);
/* m4aSongNumStart is declared in functions.h (via global.h) as void(u16).
 * sub_80BCD5C and m4aSongNumStart now resolve as real relocatable globals at
 * the same addresses, so no absolute `.set` binding is needed (an absolute
 * `.set NAME, 0x08XXXXXX+1` would not relocate under the +0x40000 harness). */

void sub_80BCD74(struct GameRankProc *proc)
{
    int acc;
    int idx;

    acc = proc->unk30 + 0x20;
    proc->unk30 = acc;

    proc->unk4c[proc->unk2c] = ((acc % 0x200) > 0xff)
        ? (0x100 - (acc % 0x100))
        : (acc % 0x100);

    if (proc->unk4c[proc->unk2c] == 0)
        proc->unk40[proc->unk2c]++;

    idx = proc->unk2c;
    if (proc->unk40[idx] == proc->ranks[idx] && proc->unk4c[idx] == 0x100)
    {
        proc->unk30 = 0;

        if ((gUnk_0202BCEC.flags14 & 0x80) && idx == 3)
        {
            sub_80BCD5C(0xf, proc);
        }
        else
        {
            sub_80BCD5C(proc->unk2c + 0xa, proc);
        }

        proc->unk2c++;

        {
            register u8 *ram asm("r0");
            register int flag asm("r0");

            ram = (u8 *)0x0202BCEC;
            asm("" : "=r"(ram) : "0"(ram));
            ram += 0x41;
            flag = *ram;
            flag <<= 0x1e;
            if (flag >= 0)
                m4aSongNumStart(0x85);
        }

        Proc_Break(proc);
    }
}
