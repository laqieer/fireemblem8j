#include "global.h"

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

//! FE8U = 0x080ACB14
void UiSpinningArrows_Init(struct SpinningArrowProc * proc)
{
    proc->kind = 0;
    proc->oam2 = 0;

    proc->unk_4c[0] = 0;
    proc->unk_44[0] = 0;
    proc->y[0] = 0;
    proc->x[0] = 0;

    proc->unk_4c[1] = 0;
    proc->unk_44[1] = 0;
    proc->y[1] = 0;
    proc->x[1] = 0;

    proc->flags = 0;

    return;
}
