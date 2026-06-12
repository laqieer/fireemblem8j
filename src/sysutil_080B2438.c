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

void EnableUnransportWindow(int index, int layer, int x, int y, int w, int h, u16 chr)
{
    struct ProcSysGrayBox * proc = Proc_Find(ProcScr_SysGrayBox);
    if (proc)
    {
        struct SysGrayBoxConf * config = &proc->priv[index];
        config->valid = true;

        config->layer = layer;
        config->x = x;
        config->y = y;
        config->width = w;
        config->height = h;
        config->chr = chr;
    }
}
