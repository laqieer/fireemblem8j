#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"

int ClassChgMenuItem_OnTextDraw(struct MenuProc *pmenu, struct MenuItemProc *pmitem)
{
    u8 unused_stack[0x48];
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ClassChgMenuOnDrawCore(pmenu, pmitem, GetStringFromIndex(GetClassData(gparent->jid[pmitem->itemNumber])->nameTextId));
}
