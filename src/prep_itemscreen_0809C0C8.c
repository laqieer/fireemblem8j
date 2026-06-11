#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];

u16 CONST_DATA gPrepShopInventory[] =
{
    ITEM_SWORD_IRON,
    ITEM_LANCE_IRON,
    ITEM_AXE_IRON,
    ITEM_BOW_IRON,
    ITEM_ANIMA_FIRE,
    ITEM_DARK_FLUX,
    ITEM_LIGHT_LIGHTNING,
    ITEM_STAFF_HEAL,

    ITEM_NONE,
};





//! FE8U = 0x08099DE8
void StartPrepItemUse(struct PrepItemScreenProc * proc)
{
    StartPrepItemUseScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E00
void StartPrepItemSupply(struct PrepItemScreenProc * proc)
{
    StartPrepItemSupplyProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E18
void StartPrepSell(struct PrepItemScreenProc * proc)
{
    StartWorldMapSellScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E30
void StartPrepItemListScreen(struct PrepItemScreenProc * proc)
{
    StartPrepItemListScreenProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
    return;
}

//! FE8U = 0x08099E48
void StartPrepArmory(struct PrepItemScreenProc * proc)
{
    StartArmoryScreen(GetUnitFromPrepList(proc->selectedUnitIdx), gPrepShopInventory, proc);
    return;
}

//! FE8U = 0x08099E68
void PrepItem_ClearGMapMenuOnCancel(struct PrepItemScreenProc * proc)
{
    if (!gGMData.state.bits.state_0)
    {
        return;
    }

    if (!proc->unk_29)
    {
        return;
    }

    SetGMapBaseMenuPid(CHARACTER_NONE);

    return;
}
