#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"
#include "proc.h"

extern struct ProcCmd sProcScr_PrepUnitSwap[];

int PrepUnitSwapProcExits()
{
    if (Proc_Find(sProcScr_PrepUnitSwap))
        return 1;
    else
        return 0;
}
