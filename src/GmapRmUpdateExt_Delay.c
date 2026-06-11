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

void GmapRmUpdateExt_Delay(struct ProcGmapRmUpdate * proc)
{
    if (--proc->delay <= 0)
        Proc_Break(proc);
}
