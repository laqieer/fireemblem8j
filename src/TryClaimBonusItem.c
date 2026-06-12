#include "global.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

void SetBonusItemClaimed(int idx);

//! FE8U = 0x080B11E4
bool TryClaimBonusItem(struct BonusClaimProc * proc)
{
    int itemId;

    int tmp = proc->submenuIndex;
    struct BonusClaimConfig * base = gpBonusClaimConfig;
    struct BonusClaimConfig * unk = base - (-tmp);
    struct BonusClaimItemEnt * itemEnt = gpBonusClaimItemList + proc->menuIndex;
    int tmp2 = itemEnt->unk_00;

    struct BonusClaimEnt* ent = gpBonusClaimData;
    ent += tmp2;

    itemId = ent->itemId;

    if (unk->hasInventorySpace == 0)
        return false;

    SetBonusItemClaimed(proc->menuIndex);
    DrawBonusClaimItemText(proc->menuIndex);

    if (proc->submenuIndex == proc->targets - 1)
        AddItemToConvoy(MakeNewItem(itemId));
    else
        UnitAddItem(gpBonusClaimConfig[proc->submenuIndex].unit, MakeNewItem(itemId));

    return true;
}
