#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "bmitemuse.h"
#include "constants/songs.h"

u8 RepairMenuItemSelect(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
    {
        int msgId = 0;

        int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];

        if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
            msgId = 0x7E1; // TODO: msgid "Item cannot be repaired."
        else if (!(GetItemAttributes(item) & (IA_STAFF | IA_WEAPON)))
            msgId = 0x7D5; // TODO: msgid "Only weapons, tomes, and[N]staves can be repaired."
        else if (GetItemUses(item) == GetItemMaxUses(item))
            msgId = 0x7D4; // TODO: msgid "There's nothing to repair."

        if (msgId != 0)
            MenuFrozenHelpBox(menu, msgId);

        return MENU_ACT_SND6B;
    }

    gActionData.trapType = menuItem->itemNumber;
    SetStaffUseAction(gActiveUnit);

    return MENU_ACT_SKIPCURSOR + MENU_ACT_END + MENU_ACT_SND6A + MENU_ACT_CLEAR + MENU_ACT_ENDFACE;
}
