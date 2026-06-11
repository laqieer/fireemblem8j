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



/* prototypes for same-file helpers called by this run */
void GmapRm_SetPosition(s16 x, s16 y);

void GmapRmUpdateExt_End(struct ProcGmapRmUpdate * proc)
{
    GmapRm_SetPosition(proc->x1, proc->y1);
}
