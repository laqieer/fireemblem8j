#include "global.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"

extern struct ProcCmd gProcScr_UiCursorHand[];

struct Unk2C
{
    /* 00 */ u8 a;
    /* 01 */ u8 b;
    /* 02 */ u8 c;
    /* 03 */ u8 d;
};

struct CursorHandProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ struct Unk2C unk_2c[4];
    /* 3C */ u8 flags[4];
    /* 40 */ s16 x[4];
    /* 48 */ s16 y[4];
};

void UiCursorHand_0(int index, int a, int b, int c, int d)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        proc->unk_2c[index].a = a;
        proc->unk_2c[index].b = b;
        proc->unk_2c[index].c = c;
        proc->unk_2c[index].d = d;
    }

    return;
}
