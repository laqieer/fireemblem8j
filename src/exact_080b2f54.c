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

void BmBgfx_Init(struct ProcBmBgfx * proc)
{
    proc->conf = 0;
    proc->bg = 0;
    proc->vram_base = 0;
    proc->vram_free_space = 0;
    proc->vram_base_offset = 0;
    proc->size_per_fx = 0;
    proc->flip = 0;
    proc->timer = 0;
    proc->total_duration = 0;
    proc->counter_procloop = 0;
    proc->callback = 0;
    proc->func_call_type = 0;
    proc->counter_functioncall = 0;
    proc->x = 0;
    proc->y = 0;
    proc->loop_en = 1;
    proc->counter = 0;
}
