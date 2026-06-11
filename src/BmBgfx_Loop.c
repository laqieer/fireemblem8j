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

void BmBgfx_Loop(struct ProcBmBgfx * proc)
{
    struct BmBgxConf * conf = proc->conf;

    if (proc->callback != NULL)
    {
        proc->func_call_type = 0;
        if (proc->callback(proc) != 0)
            return;
    }
    else
    {
        proc->callback = NULL;
    }

    while (1)
    {
        if (conf->type == BMFX_CONFT_LOOP_START)
            conf++;

        /* Loop identifier */
        if (conf->type == BMFX_CONFT_LOOP)
        {
            if (proc->loop_en != false)
            {
                if (proc->counter == 0)
                    proc->counter = conf->duration;
                else if (proc->counter > 0)
                    proc->counter = proc->counter - 1;

                if (proc->counter != 0)
                {
                    int i;
                    struct BmBgxConf * conf_ = conf - 1;
                    for (i = conf_->type; i != BMFX_CONFT_LOOP_START; i = conf_->type)
                    {
                        conf = conf_;
                        conf_--;
                    }
                }
                else
                {
                    conf++;
                }
            }
            else
            {
                proc->counter = 0;
                conf++;
            }
        }

        if (conf->type == BMFX_CONFT_CALL_IDLE)
        {
            if (proc->callback != NULL)
            {
                proc->counter_functioncall++;
                proc->func_call_type = 1;
                proc->callback(proc);
            }
            conf++;
        }

        if (conf->type == BMFX_CONFT_BLOCKING)
            break;

        if (conf->type < 11 && conf->type > 8)
        {
            Proc_Break(proc);
            break;
        }

        if (proc->timer == 0)
        {
            switch (conf->type) {
            case BMFX_CONFT_IMG:
            case BMFX_CONFT_ZIMG:
                if (proc->vram_free_space == 0)
                    proc->flip = 1 - proc->flip;
                break;
            }

            switch (conf->type) {
            case BMFX_CONFT_IMG:
                CpuFastCopy(
                    conf->data,
                    (void *)(VRAM + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx),
                    conf->size);

                proc->vram_free_space = proc->vram_free_space + conf->size;
                break;

            case BMFX_CONFT_ZIMG:
                Decompress(
                    conf->data,
                    (void *)(VRAM + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx));

                proc->vram_free_space = proc->vram_free_space + conf->size;

                break;

            case BMFX_CONFT_TSA:
                if (proc->size_per_fx == 0x8000)
                    SetBackgroundTileDataOffset(proc->bg, (proc->vram_base + (proc->flip << 0xf)) & 0xFFFF);

                CallARM_FillTileRect(
                    BG_GetMapBuffer(proc->bg), conf->data,
                    (u16)((proc->pal_bank << 0xc) +
                            (((proc->vram_base_offset + proc->flip * proc->size_per_fx) << 0x11) >> 0x16)));

                proc->vram_free_space = 0;
                BG_EnableSyncByMask(1 << proc->bg);

                break;

            case BMFX_CONFT_PAL:
                ApplyPalettes(conf->data, proc->pal_bank, conf->size);
                break;
            }
        }

        proc->timer++;
        if (proc->timer <= conf->duration)
            break;

        conf++;
        proc->timer = 0;
    }

    proc->conf = conf;
    proc->counter_procloop++;
}
