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



















extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];



EWRAM_DATA struct Text gShopItemTexts[SHOP_TEXT_LINES + 1] = {0};
extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;
struct Text gText_GoldBox;

/* prototypes for same-file helpers called by this run */
void DrawShopItemPriceLine(struct Text * th, int item, struct Unit * unit, u16 * dst);
void DrawShopItemLine(struct Text * th, int item, struct Unit * unit, u16 * dst);
void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc);

void ShopDrawBuyItemLine(struct ProcShop * proc, int itemIndex)
{
    u16 item;
    int index = DivRem(itemIndex, 6);

    SetTextFont(0);
    InitSystemTextFont();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0)
        DrawShopItemPriceLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F))
        );
}

void ShopDrawSellItemLine(struct ProcShop * proc, int itemIndex)
{
    u16 item;

    int index = DivRem(itemIndex, 6);

    SetTextFont(0);
    InitSystemTextFont();

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item != 0)
        DrawShopItemLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, (itemIndex * 2 & 0x1F))
        );
}

void Shop_InitBuyState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_idx,
        proc->shopItemCount,
        5,
        proc->hand_idx,
        72,
        ShopDrawBuyItemLine,
        proc);
}
