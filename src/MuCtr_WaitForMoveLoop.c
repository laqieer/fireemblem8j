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

//! FE8U = 0x0807A194
bool MuCtr_WaitForMoveLoop(struct MuCtrlProc * proc)
{
    struct MuProc * muProc = proc->muProc;

    SortMus();

    if (!IsMuActive(muProc))
    {
        struct Unit * unit = proc->unit;
        unit->xPos = proc->unk_42;
        unit->yPos = proc->unk_43;

        proc->timer++;

        if ((proc->timer < proc->redaCount && muProc->fast_walk_b == 0))
        {
            proc->delayFrames = (proc->timer + proc->redas)->delayFrames;
            return false;
        }

        Proc_Goto(proc, 1);
        return false;
    }

    return true;
}
