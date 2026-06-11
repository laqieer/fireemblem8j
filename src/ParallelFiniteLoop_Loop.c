#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void ParallelFiniteLoop_Loop(struct ParallelFiniteLoopProc * proc)
{
    if (proc->count >= proc->maxCount)
    {
        proc->func(proc->proc_parent);
        Proc_Break(proc);
    }
    proc->count++;
}
