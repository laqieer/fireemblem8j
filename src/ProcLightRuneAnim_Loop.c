#include "global.h"
#include <string.h>
#include "hardware.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "variables.h"

extern const struct VectorBmfx Vectors_LightRune[];

void ProcLightRuneAnim_Loop(struct ProcBmFx *proc)
{
    struct VectorBmfx buf[13];
    int x, y;

    memcpy(buf, Vectors_LightRune, 0x34);
    proc->counter++;

    x = buf[proc->counter / 3].x;
    y = buf[proc->counter / 3].y;

    if (0xFF == x) {
        Proc_Break(proc);
        return;
    }

    if (0x18 == x && 0x09 == y)
        RefreshUnitSprites();

    TileMap_CopyRect(TILEMAP_LOCATED(gUiTmScratchA, x, y), gBG0TilemapBuffer, 8, 9);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

}
