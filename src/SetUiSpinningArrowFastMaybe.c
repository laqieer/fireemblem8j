#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_UiSpinningArrows[];

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int kind;
    /* 30 */ int flags;
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int unk_44[2]; // first arrow current frame?
    /* 4C */ int unk_4c[2]; // second arrow current frame?
    /* 54 */ u16 oam2;
};

//! FE8U = 0x080ACDA4
void SetUiSpinningArrowFastMaybe(int kind)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        if (kind == 0)
        {
            proc->unk_4c[0] = 1;
        }

        if (kind == 1)
        {
            proc->unk_4c[1] = 1;
        }

        if (kind == 2)
        {
            proc->unk_4c[0] = 1;
        }

        if (kind == 3)
        {
            proc->unk_4c[1] = 1;
        }
    }

    return;
}
