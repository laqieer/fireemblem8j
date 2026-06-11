#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "bmitemuse.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_SquareSelectTorch[];

s8 CanUnitUseFruitItem(struct Unit* unit);
s8 CanUnitUseStatGainItem(struct Unit* unit, int item);

void DoUseTorchStaff(struct Unit* unit)
{
    Proc_Start(gProcScr_SquareSelectTorch, PROC_TREE_3);
    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
}

s8 CanUnitUseItemPrepScreen(struct Unit* unit, int item)
{
    if (GetItemAttributes(item) & IA_STAFF)
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_BOOSTER_HP:
    case ITEM_BOOSTER_POW:
    case ITEM_BOOSTER_SKL:
    case ITEM_BOOSTER_SPD:
    case ITEM_BOOSTER_LCK:
    case ITEM_BOOSTER_DEF:
    case ITEM_BOOSTER_RES:
    case ITEM_BOOSTER_MOV:
    case ITEM_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_HEAVENSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case ITEM_METISSTOME:
        if (unit->state & US_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case ITEM_JUNAFRUIT:
        return CanUnitUseFruitItem(unit);

    default:
        return FALSE;

    }
}

s8 DoesUnitHoldItemCC(struct Unit* unit)
{
    int i, count = GetUnitItemCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetItemIndex(unit->items[i]) == ITEM_UNK_CC)
            return TRUE;
    }

    return FALSE;
}
