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

u8 ClassChgMenuItem_3rdUsability(const struct MenuItemDef * _def, int _number)
{
    struct ProcClassChgMenuSel *proc = Proc_Find(ProcScr_ClassChgMenuSel);
    struct ProcPromoSel *parent = proc->proc_parent;
    struct ProcPromoMain *gparent = parent->proc_parent;

    if (Check3rdTraineeEnabled()) {
        switch (GetUnitFromCharId(gparent->pid)->pClassData->number) {
        case CLASS_JOURNEYMAN:
        case CLASS_PUPIL:
        case CLASS_RECRUIT:
            return MENU_ENABLED;

        default:
            return MENU_NOTSHOWN;
        }
    }

    return MENU_NOTSHOWN;
}
