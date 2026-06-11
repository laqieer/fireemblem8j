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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ShopBuyInit[];
extern struct ProcCmd ProcScr_ShopSellInit[];

void DrawShopItemLine(struct Text * th, int item, struct Unit * unit, u16 * dst);
void Shop_InitBuyState(struct ProcShop * proc);

void DisplayGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    ClearGoldBoxTextTm2Line(tm, SHOP_TEXT_LINES + 1);
    PutNumber(tm, 2, GetPartyGoldAmount());
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ShopInitTexts_OnBuy(struct ProcShop * parent)
{
    struct ProcShopInit * proc;
    int i;

    parent->buy_or_sel = SHOP_ST_BUY;

    proc = Proc_Start(ProcScr_ShopBuyInit, PROC_TREE_3);
    proc->shopproc = parent;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = parent->hand_idx; i < parent->hand_idx + SHOP_TEXT_LINES; i++)
        PutBlankText(
            &gShopItemTexts[DivRem(i, SHOP_TEXT_LINES + 1)],
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));

    BG_SetPosition(BG_2, 0, (parent->hand_idx * 0x10) - 0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void DrawShopSoldItems(struct ProcShop * proc)
{
    int item;
    int index;
    int i;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = proc->hand_idx; i < proc->hand_idx + SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = proc->hand_idx; i < proc->hand_idx + SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        item = proc->shopItems[i];

        if (item == 0)
            break;

        DrawShopItemPriceLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F))
        );
    }
    BG_SetPosition(BG_2, 0, (proc->hand_idx * 0x10) - 0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void InitShopBuyStatus(struct ProcShopInit * proc)
{
    Shop_InitBuyState(proc->shopproc);
    DrawShopSoldItems(proc->shopproc);

    Proc_Break(proc);
}

void ShopInitTexts_OnSell(struct ProcShop * parent)
{
    struct ProcShopInit * proc;
    int i;

    parent->buy_or_sel = SHOP_ST_SELL;

    proc = Proc_Start(ProcScr_ShopSellInit, PROC_TREE_3);
    proc->shopproc = parent;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < SHOP_TEXT_LINES; i++)
        PutBlankText(
            &gShopItemTexts[DivRem(i, SHOP_TEXT_LINES + 1)],
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));

    BG_SetPosition(2, 0, -0x48);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void ShopDrawDefaultSellItemLine(struct ProcShop * proc)
{
    int i;
    int index;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < SHOP_TEXT_LINES; i++)
    {
        index = DivRem(i, SHOP_TEXT_LINES + 1);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = 0; i < SHOP_TEXT_LINES; i++)
    {
        int item;

        index = DivRem(i, SHOP_TEXT_LINES + 1);
        item = proc->unit->items[i];

        if (item == 0)
            break;

        DrawShopItemLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBG2TilemapBuffer + TILEMAP_INDEX(7, ((i * 2) & 0x1F)));
    }
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void InitShopSellStatus(struct ProcShopInit * proc)
{
    Shop_InitSellState(proc->shopproc);
    ShopDrawDefaultSellItemLine(proc->shopproc);
    Proc_Break(proc);
}
