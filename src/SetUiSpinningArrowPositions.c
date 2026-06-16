#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h"

extern struct ProcCmd gProcScr_UiSpinningArrows[];

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int kind;
    /* 30 */ int flags;
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int unk_44[2];
    /* 4C */ int unk_4c[2];
    /* 54 */ u16 oam2;
};

void SetUiSpinningArrowPositions(int x1, int y1, int x2, int y2)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        proc->x[0] = x1;
        proc->y[0] = y1;

        proc->x[1] = x2;
        proc->y[1] = y2;
    }

    return;
}
