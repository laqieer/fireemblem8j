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

u16 ShopSt_GetHeadLoc(void);

void Shop_Loop_SellKeyHandler(struct ProcShop * proc)
{
    u8 cur;
    u32 cursor_at_head;
    int a;
    int b;

    Shop_TryMoveHandPage();

    BG_SetPosition(BG_2, 0, ShopSt_GetBg2Offset());

    cur = proc->head_loc;
    cursor_at_head = ShopSt_GetHeadLoc() != cur;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    a = proc->head_loc;
    a *= 16;
    b = ((proc->hand_loc * 16)) - 0x48;

    DisplayUiHand(56, a - b);

    if (proc->helpTextActive && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 0x48);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->head_loc]);
    }

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive)
    {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = false;
            CloseHelpBox();
        }
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = true;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->unit->items[proc->head_loc]);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (!IsItemSellable(proc->unit->items[proc->head_loc]))
        {
            StartShopDialogue(0x85B, proc);
            // SHOP_TYPE_ARMORY: "I can't buy that.[.][A]"
            // SHOP_TYPE_VENDOR: "I can't buy that.[.][A]"
            // SHOP_TYPE_SECRET_SHOP: "Hee hee... Wait a minute.[.][NL]I can't buy that![.][A]"

            Proc_Goto(proc, PL_SHOP_SELL);
        }
        else
        {
            SetTalkNumber(GetItemSellPrice(proc->unit->items[proc->head_loc]));
            StartShopDialogue(0x855, proc);
            // SHOP_TYPE_ARMORY: "How does [.][G] gold[.][NL]sound to you?[.][Yes]"
            // SHOP_TYPE_VENDOR: "That's worth [.][G] gold.[NL]Is that all right?[Yes]"
            // SHOP_TYPE_SECRET_SHOP: "That is worth [G] gold.[NL]Is that acceptable?[.][Yes]"

            Proc_Break(proc);
        }

        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, PL_SHOP_ANYTHING_ELSE);
        return;
    }
}
