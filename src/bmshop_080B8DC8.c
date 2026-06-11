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

void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent)
{
    struct ProcShop * proc;
    const u16 * shopItems;
    int i;

    EndPlayerPhaseSideWindows();

    if (parent)
        proc = Proc_StartBlocking(gProcScr_Shop, parent);
    else
        proc = Proc_Start(gProcScr_Shop, PROC_TREE_3);

    proc->shopType = shopType;
    proc->unit = unit;

    shopItems = gDefaultShopInventory;
    if (inventory != 0)
        shopItems = inventory;

    for (i = 0; i <= SHOP_ITEMS_MAX_AMT; i++)
        proc->shopItems[i] = MakeNewItem(*shopItems++);

    UpdateShopItemCounts(proc);
}
