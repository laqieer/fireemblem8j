#include "global.h"
#include "sio.h"
#include "proc.h"

ProcPtr StartSioWarpFxPartial(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, s8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;
    int ps = playStepSe;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_SioWarpFxPartial, parent);
    else
        proc = Proc_Start(ProcScr_SioWarpFxPartial, PROC_TREE_2);

    proc->unit = unit;
    proc->muProc = muProc;
    proc->x = x;
    proc->y = y;
    proc->facing = facing;
    proc->playStepSe = ps;

    return proc;
}
