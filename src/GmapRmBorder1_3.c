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

void GmapRmBorder1_3(struct ProcGmapRmBorder1 * proc)
{
    GmapRmBorder1_PutSpriteAll(proc);
    if (CheckGmapRmBaPalAnim1State())
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
