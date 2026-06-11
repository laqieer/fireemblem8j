#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];







//! FE8U = 0x08099F68
ProcPtr StartPrepItemScreen(ProcPtr proc)
{
    return Proc_StartBlocking(ProcScr_PrepItemScreen, proc);
}

//! FE8U = 0x08099F7C
void PrepItemScreen_DrawUnitItems(struct Text * text, u16 * tilemap, struct Unit * unit, u16 flags)
{
    int itemCount;
    int i;

    TileMap_FillRect(tilemap, 12, 20, 0);

    if (flags & 2)
    {
        ResetIconGraphics();
    }

    if (unit == NULL)
    {
        return;
    }

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; text++, i++)
    {
        u16 item = unit->items[i];

        int isUnusable = (flags & 4) ? !CanUnitUseItemPrepScreen(unit, item) : !IsItemDisplayUsable(unit, item);

        if (!(flags & 1))
        {
            ClearText(text);
            Text_SetColor(text, isUnusable);
            Text_SetCursor(text, 0);
            Text_DrawString(text, GetItemName(item));
        }

        DrawIcon(TILEMAP_LOCATED(tilemap, 0, i * 2), GetItemIconId(item), OAM2_PAL(4));

        PutText(text, TILEMAP_LOCATED(tilemap, 2, i * 2));
        PutNumberOrBlank(
            TILEMAP_LOCATED(tilemap, 11, i * 2), !isUnusable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetItemUses(item));
    }

    return;
}

//! FE8U = 0x0809A08C
void PrepItem_SnapGridScroll(struct PrepItemScreenProc * proc)
{
    int hoverRow = proc->hoverUnitIdx / 3;
    int hoverYPos = hoverRow * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;
    int yDiff = hoverYPos - proc->scrollOffset;

    if (yDiff > 32)
    {
        if (hoverYPos == yMax)
        {
            proc->scrollOffset = hoverYPos - 48;
        }
        else
        {
            proc->scrollOffset = hoverYPos - 32;
        }
    }
    else if (yDiff < 16)
    {
        if (hoverYPos == 0)
        {
            proc->scrollOffset = hoverYPos;
        }
        else
        {
            proc->scrollOffset = hoverYPos - 16;
        }
    }

    BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);

    return;
}
