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

void StartParallelFiniteLoop(void * func, int count, ProcPtr parent)
{
    struct ParallelFiniteLoopProc * proc =
        Proc_Start(ProcScr_ParallelFiniteLoop, parent);

    proc->maxCount = count;
    proc->func = (ParallelWorkerFunc *)func;
}
