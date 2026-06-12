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







//! FE8U = 0x08098FAC
void PrepItem_UpdateGridScroll(struct PrepItemScreenProc * proc)
{
    int hoverYPos = (proc->hoverUnitIdx / 3) * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;

    if (((hoverYPos - proc->scrollOffset) > 32) && ((proc->scrollOffset + 48) < yMax))
    {
        proc->scrollOffset += proc->scrollAmount;

        BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    if (((hoverYPos - proc->scrollOffset) < 16) && (proc->scrollOffset != 0))
    {
        proc->scrollOffset -= proc->scrollAmount;

        BG_SetPosition(BG_2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    return;
}
