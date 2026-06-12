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

void HideSysHandCursor(void)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        Proc_Goto(proc, 0);
}
