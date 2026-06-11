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

void GmapRm_Blocking(struct ProcGmapRm * proc)
{
    if (proc->flag & GMAPRM_FLAG_UNBLOCK)
        Proc_Break(proc);
}
