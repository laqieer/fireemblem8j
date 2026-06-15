#include "global.h"
extern struct ProcCmd gProcScr_UiSpinningArrows[];
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations

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

//! FE8U = 0x080ACD60
void SetUiSpinningArrowConfig(int flags)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        proc->flags = flags;
    }

    return;
}
