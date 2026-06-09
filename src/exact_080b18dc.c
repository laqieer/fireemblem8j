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

void SysBlackBox_Init(struct SysBlackBoxProc * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->valid[i] = 0;
}
