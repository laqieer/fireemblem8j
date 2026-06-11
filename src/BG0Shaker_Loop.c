#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"

void BG0Shaker_Loop(struct MAFrameShakeProc * proc)
{
    BG_SetPosition(0,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    BG_SetPosition(1,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    if (proc->timer++ > 15)
    {
        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);

        Proc_Break(proc);
    }
}
