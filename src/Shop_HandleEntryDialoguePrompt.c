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

void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case TALK_CHOICE_CANCEL:
    default:
        Proc_Goto(proc, PL_SHOP_EXIT);
        return;

    case TALK_CHOICE_YES:
        Proc_Goto(proc, PL_SHOP_BUY);
        return;

    case TALK_CHOICE_NO:
        if (GetUnitItemCount(proc->unit) == 0)
        {
            StartShopDialogue(0x84C, proc);
            // SHOP_TYPE_ARMORY: "You've got nothing to sell![.][A]"
            // SHOP_TYPE_VENDOR: "You have nothing to sell.[.][A]"
            // SHOP_TYPE_SECRET_SHOP: "You've got nothing to sell![.][A]"

            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        }
        else
        {
            Proc_Goto(proc, PL_SHOP_SELL);
        }
    }
}
