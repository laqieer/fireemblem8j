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

void FadeInOut_DisableGfx(struct ProcFadeInOut * proc)
{
    if (proc->mask == 0xFFFF)
    {
        SetDispEnable(0, 0, 0, 0, 1);
    }
    else
    {
        SetDispEnable(0, 0, 0, 0, 0);
    }
}
