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

bool CheckBmBgfxDone(void)
{
    if (Proc_Find(ProcScr_BmBgfx))
        return true;

    return false;
}
