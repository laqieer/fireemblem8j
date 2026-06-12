#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

void NewPopup_ItemGot(ProcPtr parent, struct Unit *unit, u16 item)
{
    struct GotItemPopupProc * proc;

    proc = (PROC_IS_ROOT(parent))
         ? Proc_Start(ProcScr_GotItem, parent)
         : Proc_StartBlocking(ProcScr_GotItem, parent);

    proc->item = item;
    proc->unit = unit;

    if (FACTION_RED == UNIT_FACTION(unit))
        unit->state |= US_DROP_ITEM;
}
