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

void GmapRmBorder1_4(struct ProcGmapRmBorder1 * proc)
{
    GmapRmBorder1_PutSpriteAll(proc);
    if (proc->flag)
        Proc_Break(proc);
}
