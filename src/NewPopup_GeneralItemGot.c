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

void NewPopup_GeneralItemGot(struct Unit *unit, int item, ProcPtr parent)
{
    u16 _item = item;
    switch (ITEM_INDEX(_item)) {
    case ITEM_1G:
    case ITEM_5G:
    case ITEM_10G:
    case ITEM_50G:
    case ITEM_100G:
    case ITEM_3000G:
    case ITEM_5000G:
    case ITEM_150G:
    case ITEM_200G:
        NewPopup_GoldGot(parent, unit, GetItemCost(_item));
        break;

    default:
        NewPopup_ItemGot(parent, unit, _item);
        break;
    } /* switch item index */
}
