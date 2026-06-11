#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

void GmapRm_BlendOut(struct ProcGmapRm * proc)
{
    if (++proc->timer < 75)
    {
        u16 val = (proc->timer * 0x10) / 75;
        SetBlendConfig(1, 0x10 - val, val, 0);
    }
    else
    {
        Proc_Break(proc);
    }
}
