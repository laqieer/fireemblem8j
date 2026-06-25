#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "ctc.h"

// JP-only SIO link-arena menu cursor/icon draw proc. Field offsets read from
// the gbadisasm oracle; named locally to avoid touching the shared sio.h struct.
struct SioMenuIconProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ int unk_2c[3];
    /* 38 */ s16 unk_38[3];
    /* 3E */ s16 unk_3e[3];
    /* 44 */ int cursor;
    /* 48 */ STRUCT_PAD(0x48, 0x50);
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
};

// JP-only SIO link-arena option/data table (EWRAM); placeholder name. The
// per-entry play-time totals live in the int[] member at offset 0xC.
struct SioMenuDataTable
{
    /* 00 */ STRUCT_PAD(0x00, 0x0C);
    /* 0C */ int frameTotal[3];
};

extern struct SioMenuDataTable gUnk_02000C04;

extern const u16 gObj_80491B8_a[];
extern const u16 gObj_80491B8_b[];

void sub_80490C8(u32 frameTotal);
void DisplayUiHand(int x, int y);

void sub_80491B8(struct SioMenuIconProc * proc)
{
    int i;

    for (i = 0; i <= 2; i++)
    {
        PutSprite(4, proc->unk_38[i], proc->unk_3e[i], gObj_80491B8_a, (proc->unk_2c[i] & 0xf) << 0xc);
        PutSprite(4, proc->unk_38[i] + 0x28, proc->unk_3e[i] + 8, gObj_80491B8_b, i << 6);
    }

    sub_80490C8(gUnk_02000C04.frameTotal[proc->cursor]);

    DisplayUiHand(proc->unk_38[proc->cursor] + 0x10, proc->unk_3e[proc->cursor] + 8);

    if (proc->unk_50 == 1)
    {
        proc->unk_54 = 0;
        Proc_Break(proc);
    }
}
