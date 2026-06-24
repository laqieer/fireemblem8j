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

void GmapRmUpdateExt_ScrollPosition(struct ProcGmapRmUpdate * proc)
{
    if (++proc->timer < proc->speed)
    {
        int ret = GetEasedProgress(proc->timer, proc->speed, 0x800, 0x800);
        s16 x = proc->x0 + DivArm(0x1000, (proc->x1 - proc->x0) * ret);
        s16 y = proc->y0 + DivArm(0x1000, (proc->y1 - proc->y0) * ret);

        GmapRm_SetPosition(x, y);
    }
    else
    {
        GmapRm_SetPosition(proc->x1, proc->y1);
        Proc_Break(proc);
    }
}
