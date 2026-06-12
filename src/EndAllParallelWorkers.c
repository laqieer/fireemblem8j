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

void EndAllParallelWorkers(void)
{
    while (1)
    {
        ProcPtr proc = Proc_Find(ProcScr_ParallelWorker);
        if (proc == NULL)
        {
            break;
        }
        Proc_End(proc);
    }
}
