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






























/* prototypes for same-file helpers called by this run */
void NewPopup_ItemGot_unused(struct Unit* unit, u16 item, ProcPtr parent);

void ItemGot_DisplayLePopup(struct GotItemPopupProc * proc)
{
    NewPopup_ItemGot_unused(proc->unit, proc->item, proc);
}
