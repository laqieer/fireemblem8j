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

void StartBmBgfx(struct BmBgxConf * input, int bg, int x, int y, int vram_off, int size, int pal_bank, void * func, ProcPtr parent)
{
    struct ProcBmBgfx * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_BmBgfx, PROC_TREE_3);
    else
        proc = Proc_Start(ProcScr_BmBgfx, parent);

    proc->conf = input;
    proc->bg = bg;
    proc->pal_bank = pal_bank;

    if (size < 0)
        size = 0x4000;

    if (vram_off < 0)
        vram_off = 0;

    proc->vram_base = GetBackgroundTileDataOffset(bg);
    proc->vram_base_offset = vram_off;
    proc->size_per_fx = size;
    proc->x = x;
    proc->y = y;

    proc->callback = func;

    BG_SetPosition(bg, -x & 0xff, -y & 0xff);

    for (; input->type < BMFX_CONFT_END; input++)
        proc->total_duration += input->duration;
}
