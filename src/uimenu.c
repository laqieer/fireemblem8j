#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"

// data







static void Menu_AutoHelpBox_OnInit(struct MenuProc* proc);
 void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_Frozen_OnLoop(struct MenuProc* proc);



u8 MenuAlwaysEnabled(const struct MenuItemDef* def, int number)
{
    return MENU_ENABLED;
}

u8 MenuAlwaysDisabled(const struct MenuItemDef* def, int number)
{
    return MENU_DISABLED;
}

u8 MenuAlwaysNotShown(const struct MenuItemDef* def, int number)
{
    return MENU_NOTSHOWN;
}

u8 MenuCancelSelect(struct MenuProc* menu, struct MenuItemProc* item)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_CLEAR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 MenuStdHelpBox(struct MenuProc* menu, struct MenuItemProc* item)
{
    StartHelpBox(item->xTile*8, item->yTile*8, item->def->helpMsgId);
}

void Menu_AutoHelpBox_OnInit(struct MenuProc* proc)
{
    LoadHelpBoxGfx(NULL, -1); // TODO: NOPAL constant?
    proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
}
