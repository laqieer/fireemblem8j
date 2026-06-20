#include "global.h"
#include "gba_sprites.h"
#include "worldmap.h"
#include "ap.h"
void GmapRmBorder1_PutSprite2(struct ProcGmapRmBorder1 * proc, int x, int y, int transparency) {
    int t = (s8)transparency;
    s16 ix, iy;
    GmapRm_GetPosition(&ix, &iy);
    x -= ix;
    y -= iy;
    if (t)
        AP_Update(proc->sprite2, x, OBJ_TRANSLUCENT | y);
    else
        AP_Update(proc->sprite2, x, y);
}
