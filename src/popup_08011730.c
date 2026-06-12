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

void NewPopup_GoldGot(ProcPtr parent, struct Unit *unit, int value)
{
    SetPopupNumber(value);

    if (FACTION_BLUE == UNIT_FACTION(unit)) {
        value += GetPartyGoldAmount();
        SetPartyGoldAmount(value);
        NewPopup_Simple(PopupScr_GotGold, 0x60, 0x0, parent);
    } else
        NewPopup_Simple(PopupScr_GoldWasStole, 0x60, 0x0, parent);
}
