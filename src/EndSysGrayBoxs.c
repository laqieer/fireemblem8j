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

extern struct ProcCmd ProcScr_SysGrayBox[];

void EndSysGrayBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_SysGrayBox));
}
