#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "hardware.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "rng.h"
#include "bmtrick.h"

#include "muctrl.h"

/* prototypes for same-file helpers called by this run */
s8 MuCtr_CheckMoveDependency(u8 pid, u16 b);
void MuCtr_ExecREDA_0(struct MuCtrlProc * proc);

//! FE8U = 0x0807A0E4
s8 MuCtr_DelayMoveLoop(struct MuCtrlProc * proc)
{
    const struct REDA * reda = proc->redas + proc->timer;

    SortMus();

    if (proc->muProc->fast_walk_b != 0)
    {
        Proc_Goto(proc, 1);
        return false;
    }

    if (MuCtr_CheckMoveDependency(reda->a, reda->b) == 1)
    {
        if (gKeyStatusPtr->heldKeys & A_BUTTON)
            proc->delayFrames -= 4;
        else
            proc->delayFrames--;

        if (proc->delayFrames < 1)
        {
            MuCtr_ExecREDA_0(proc);
            return false;
        }
    }

    if (proc->timer != 0)
    {
        struct Unit * unit = proc->unit;

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;
        HideMu(proc->muProc);
        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;
        RefreshUnitSprites();
    }

    return true;
}
