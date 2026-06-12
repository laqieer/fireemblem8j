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

u8 ClassChgMenuSelOnPressB(struct MenuProc *pmenu, struct MenuItemProc *pmitem) {
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;
    struct ProcPromoMain *ggparent;
    struct ProcPromoHandler *gggparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    gggparent = ggparent->proc_parent;
    if (gggparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) 
        return 0;

    if (gggparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        Proc_End(parent);
        Proc_Goto(gparent, PROC_CLASSCHG_SEL_2);
        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
    }

    if (gggparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_End(parent);
        Proc_Goto(gparent, PROC_CLASSCHG_SEL_2);
        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;;
    }

    return 0;
}
