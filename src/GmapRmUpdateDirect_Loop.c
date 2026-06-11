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

void GmapRmUpdateDirect_Loop(struct Proc * proc)
{
    struct ProcGmapRm * parent;
    parent = proc->proc_parent;
    BG_SetPosition(BG_1, parent->x, parent->y);
}
