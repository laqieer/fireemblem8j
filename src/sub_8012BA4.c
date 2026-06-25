#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmfx.h"
#include "mapanim.h"

void NewShinningStonefx(struct Unit * unit);

// JP 0x08012BA4 (sub_8012BA4). JP counterpart of fe8u NewShinningStonefx.
// JP Unit has plain s8 xPos/yPos at +0x10/+0x11 (fe8u uses a u16 bitfield),
// so the tile->pixel conversion is a direct (xPos << 4) with no u16 widen.
void NewShinningStonefx(struct Unit * unit)
{
    int x = unit->xPos;
    int y = unit->yPos;
    struct ProcShinningStonefx * proc;

    proc = Proc_Start(ProcScr_ShinningStonefx, PROC_TREE_3);

    proc->x = SCREEN_TILE_IX(x) + 8;
    proc->y = SCREEN_TILE_IY(y);
}
