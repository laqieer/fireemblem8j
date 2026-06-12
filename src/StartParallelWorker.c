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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ParallelWorker[];

ProcPtr StartParallelWorker(void * func, ProcPtr parent)
{
    struct ParallelWorkerProc * proc = GetParallelWorker(func);
    if (proc == NULL)
    {
        proc = Proc_Start(ProcScr_ParallelWorker, parent);
        proc->func = (ParallelWorkerFunc *)func;
    }
    return proc;
}
