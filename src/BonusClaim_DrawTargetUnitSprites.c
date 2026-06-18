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

//! FE8U = 0x080B0F94
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc * proc)
{
    int i;

    for (i = 0; i < proc->targets - 1; i++)
    {
        struct Unit * unit = gpBonusClaimConfig[i].unit;

        if (gpBonusClaimConfig[i].hasInventorySpace != 0)
            PutUnitSpriteForClassId(0, 112, 48 + i * 16, 0xc400, unit->pClassData->number);
        else
            PutUnitSpriteForClassId(0, 112, 48 + i * 16, 0xf400, unit->pClassData->number);
    }
    SyncUnitSpriteSheet();
}
