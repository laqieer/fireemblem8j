#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8J = 0x080B5C3C
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc * proc)
{
    int i;

    struct Text* th = gpBonusClaimText + 12;
    int sl = proc->targets;
    int tmp = (proc->targets * 2);

    DrawUiFrame2(13, 5, 12, tmp + 2, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.win0_left = 104;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 200;
    gLCDControlBuffer.win0_bottom = (tmp + 7) * 8;

    SetUiCursorHandConfig(0, 40, proc->menuIndex * 16 + 56 - proc->unk_2c, 1);

    ShowSysHandCursor(112, proc->submenuIndex * 16 + 48, 9, 0x800);

    for (i = 0; i < sl; th++, i++)
    {
        int count;
        int color = 0;
        struct Unit * unit = gpBonusClaimConfig[i].unit;
        u16 * tm = gBG0TilemapBuffer + 16;

        ClearText(th);
        Text_SetCursor(th, 0);

        if (i == sl - 1)
        {
            count = GetConvoyItemCount();
            color = (count == CONVOY_ITEM_COUNT) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
            Text_SetParams(th, 0, color);
            Text_DrawString(th, GetStringFromIndex(0x28F)); // TODO: msgid "Supply"
        }
        else
        {
            count = GetUnitItemCount(unit);
            color = (count == UNIT_ITEM_COUNT) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
            Text_SetParams(th, 0, color);
            Text_DrawString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        if (color == 0)
            gpBonusClaimConfig[i].hasInventorySpace = 1;
        else
            gpBonusClaimConfig[i].hasInventorySpace = 0;

        PutText(th, tm + 0xc0 + 0x40 * i);

        PutNumber(
            tm + 0xc6 + 0x40 * i,
            color == 0 ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            count
        );
    }

    proc->unk_34 = StartParallelWorker(BonusClaim_DrawTargetUnitSprites, proc);
}
