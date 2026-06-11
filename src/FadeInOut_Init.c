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

void FadeInOut_Init(struct ProcFadeInOut * proc)
{
    ArchiveCurrentPalettes();
    proc->timer = 0;
}
