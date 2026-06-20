#include "global.h"

#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"

struct CursorHandProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3C);
    /* 3C */ u8 flags[4];
    /* 40 */ s16 x[4];
    /* 48 */ s16 y[4];
};

extern struct ProcCmd gProcScr_UiCursorHand[];

void SetUiCursorHandConfig(int index, int x, int y, u8 flags)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        proc->flags[index] = 1;
        proc->x[index] = x;
        proc->y[index] = y;
        proc->flags[index] = flags | 1;

        if (flags & 2)
        {
            Decompress(gImg_UiCursorHandTop, (void *)0x060100C0);
            Decompress(gImg_UiCursorHandBottom, (void *)0x060104C0);
        }
    }

    return;
}
