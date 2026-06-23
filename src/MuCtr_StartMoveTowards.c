#include "global.h"
#include "muctrl.h"

void MuCtr_StartMoveTowards(struct Unit * unit, s8 x, s8 y, u8 flagsA, u16 flagsB)
{
    struct REDA * reda;
    int x_;
    int y_;

    struct MuCtrlProc * proc = Proc_Start(ProcScr_MuCtrl, PROC_TREE_5);

    reda = &proc->reda_cur;

    x_ = x;
    reda->x = x_;
    y_ = y;
    reda->y = y_;

    reda->flags = flagsA;

    reda->a = 0;
    reda->b = 0;
    reda->delayFrames = 0;

    MuCtr_InitDefinedMove(proc, unit, reda, 1, flagsB);
}
