#include "global.h"

#include "mu.h"
#include "proc.h"

#include "muctrl.h"

struct REDA * CopyEventMoveREDAs(const struct REDA * redas, u8 count);

//! FE8U = 0x08079D74
void MuCtr_StartDefinedMove(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct MuCtrlProc * proc = Proc_Start(ProcScr_MuCtrl, PROC_TREE_5);
    switch (count) {
    case 0:
        redas = NULL;
        break;

    case 1:
        proc->reda_cur = *redas;
        redas = &proc->reda_cur;
        break;

    default:
        redas = CopyEventMoveREDAs(redas, count);
        break;
    }

    MuCtr_InitDefinedMove(proc, unit, redas, count, flags);
}
