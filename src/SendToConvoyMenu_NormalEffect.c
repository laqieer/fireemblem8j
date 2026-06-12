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

u8 SendToConvoyMenu_NormalEffect(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    AddItemToConvoy(gActiveUnit->items[proc_cmd->itemNumber]);
    gActionData.item = gActiveUnit->items[proc_cmd->itemNumber];
    UnitRemoveItem(gActiveUnit, proc_cmd->itemNumber);
    UnitAddItem(gActiveUnit, gBmSt.um_tmp_item);
    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}
