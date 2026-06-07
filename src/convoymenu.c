#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmcontainer.h"
#include "icon.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bb.h"
#include "bmunit.h"
#include "bmmenu.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmmind.h"
#include "popup.h"
#include "face.h"
#include "scene.h"
#include "helpbox.h"
#include "menuitempanel.h"
#include "prepscreen.h"





u8 SendToConvoyMenu_Idle(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    if (1 != GetTalkChoiceResult())
        return 0;

    gKeyStatusPtr->newKeys = 0;

    if (gActionData.unk08 < UNIT_ITEM_COUNT) {
        UnitRemoveItem(gActiveUnit, gActionData.unk08);
        UnitAddItem(gActiveUnit, gBmSt.um_tmp_item);
    }

    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}
