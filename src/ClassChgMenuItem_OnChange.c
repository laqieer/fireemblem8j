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

int ClassChgMenuItem_OnChange(struct MenuProc *pmenu, struct MenuItemProc *pmitem)
{
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    gparent->stat = 1;
    gparent->main_select = pmitem->itemNumber;
    ChangeClassDescription(gparent->msg_desc[gparent->main_select]);
    SetTalkPrintDelay(-1);
}
