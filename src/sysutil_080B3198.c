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

void BmBgfx_End(struct ProcBmBgfx * proc)
{
    if (proc->conf->type == 10)
    {
        SetBackgroundTileDataOffset(proc->bg, proc->vram_base);
        BG_Fill(BG_GetMapBuffer(proc->bg), 0);
        BG_EnableSyncByMask(1 << proc->bg);
    }
}
