#include "global.h"
#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "bmmind.h"
#include "scene.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "bmlib.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "gba_sprites.h"
#include "constants/faces.h"
#include "constants/items.h"
#include "constants/songs.h"

void UpdateShopItemCounts(struct ProcShop * proc);

void Shop_HandleSellConfirmPrompt(struct ProcShop * proc)
{
    if (GetTalkChoiceResult() == TALK_CHOICE_YES)
    {
        PlaySeDelayed(0xB9, 8);

        gActionData.unitActionType = UNIT_ACTION_SHOPPED;

        SetPartyGoldAmount(GetPartyGoldAmount() + GetItemSellPrice(proc->unit->items[proc->head_loc]));

        UnitRemoveItem(proc->unit, proc->head_loc);

        UpdateShopItemCounts(proc);
        ShopInitTexts_OnSell(proc);
        DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));

        if (proc->unitItemCount == 0)
            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
    }
    else
        Proc_Goto(proc, PL_SHOP_SELL);
}
