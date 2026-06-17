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




int MenuCommand_DrawExtraItem(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    u16 item = gBmSt.um_tmp_item;
    struct Text* text = &proc_cmd->text;

    Text_SetColor(text, TEXT_COLOR_SYSTEM_BLUE);
    DrawItemMenuLineNoColor(text, item,
            TILEMAP_LOCATED(gBG0TilemapBuffer, proc_cmd->xTile, proc_cmd->yTile));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
