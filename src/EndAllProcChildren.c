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

void EndAllProcChildren(ProcPtr p)
{
    ProcPtr proc = NULL;
    while (1)
    {
        proc = Proc_FindAfterWithParent(proc, p);
        if (!proc)
            break;

        Proc_End(proc);
    }
}
