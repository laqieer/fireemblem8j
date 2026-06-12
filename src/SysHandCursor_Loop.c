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

void SysHandCursor_Loop(struct SysHandCursorProc * proc)
{
    DisplayUiHand(proc->x, proc->y);

    if (proc->enable_sysshadow != false)
        DisplayExtendedSysHand(proc);

    if (proc->enable_bmshadow != false)
        DisplayBmTextShadow(proc->x, proc->y + 2);
}
