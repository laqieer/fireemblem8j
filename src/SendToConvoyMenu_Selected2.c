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

u8 SendToConvoyMenu_Selected2(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    gActionData.item = gBmSt.um_tmp_item;
    gActionData.unk08 = UNIT_ITEM_COUNT;
    LoadHelpBoxGfx(NULL, -1);
    /* maybe draw hand? */
    StartBoxDialogue(0x8, proc_cmd->itemNumber * 0x10 + 0x20, 0x7C9, proc_menu);
    return 0;
}
