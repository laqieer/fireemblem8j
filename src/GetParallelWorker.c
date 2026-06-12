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

ProcPtr GetParallelWorker(void * func)
{
    struct ParallelWorkerProc * proc = NULL;
    while ((proc = Proc_FindAfter(ProcScr_ParallelWorker, (struct Proc *)proc)))
        if (proc->func == func)
            return proc;

    return NULL;
}
