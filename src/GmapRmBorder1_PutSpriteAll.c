#include "global.h"
#include "proc.h"
#include "gba_sprites.h"
#include "ap.h"
#include "worldmap.h"

void GmapRmBorder1_PutSpriteAll(struct ProcGmapRmBorder1 * proc)
{
    s16 ix, iy, x, y;
    GmapRm_GetPosition(&ix, &iy);

    x = GfxSet_WmNationMap[proc->index].x - ix;
    if (x) {}
    y = GfxSet_WmNationMap[proc->index].y - iy;
    if (y) {}

    AP_Update(proc->sprite1, x, OBJ_TRANSLUCENT | y);

    x = GfxSet_WmNationMap[proc->index].x;
    y = GfxSet_WmNationMap[proc->index].y;

    GmapRmBorder1_PutSprite2(proc, x, y, 0);
}
