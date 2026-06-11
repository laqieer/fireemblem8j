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

void ShowSysHandCursor(int x, int y, int shadow_len, u16 chr)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
    {
        proc->x = x;
        proc->y = y;

        if (shadow_len == 0)
            proc->enable_sysshadow = false;
        else
        {
            proc->enable_sysshadow = true;
            proc->shadow_len = shadow_len;
            proc->chr2 = chr;
        }
        Proc_Goto(proc, 1);
    }
}
