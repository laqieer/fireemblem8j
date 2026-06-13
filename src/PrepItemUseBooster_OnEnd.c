#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "icon.h"
#include "hardware.h"
#include "mapanim.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "constants/songs.h"

void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc)
{
    struct ProcPrepItemUse *parent = proc->proc_parent;
    int max = GetUnitItemCount(parent->unit);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 14), 12, 1, 0);

    if (max == 0) {
        Proc_Goto(parent, 0x6);
    } else {
        if (parent->slot >= max)
            parent->slot--;

        ShowSysHandCursor(0x10, parent->slot * 0x10 + 0x48, 0xB, 0x800);
    }

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &gPrepItemTexts[15],
        parent->unit, 1
    );

    DrawPrepScreenItemUseDesc(parent->unit, parent->slot);

    ClearUiCursorHandConfig(0);
    EndManimLevelUpStatGainLabels();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);
    LoadHelpBoxGfx(OBJ_VRAM1, -1);
}
