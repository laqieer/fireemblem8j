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



void NewPopup_ItemStealing(u16 item, ProcPtr parent)
{
    SetPopupItem(item);

    if (FACTION_BLUE == UNIT_FACTION(gActiveUnit))
        NewPopup_Simple(PopupScr_StoleItem, 0x60, 0x0, parent);
    else
        NewPopup_Simple(PopupScr_ItemStolen, 0x60, 0x0, parent);
}
