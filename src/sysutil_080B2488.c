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

void DisableSysGrayBox(int index)
{
    struct ProcSysGrayBox * proc = Proc_Find(ProcScr_SysGrayBox);

    if (proc != NULL)
    {
        struct SysGrayBoxConf * config = &proc->priv[index];
        config->valid = false;
    }
}
