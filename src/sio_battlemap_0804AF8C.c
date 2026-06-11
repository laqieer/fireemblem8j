#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

//! FE8U = 0x0804A1D0
void LABattleMap_DetermineAttackRange(struct SioProc85AA1AC * proc)
{
    u16 item = gActiveUnit->items[gUnk_Sio_16.unk_07];

    proc->unk_64 = GetGameLock();

    if ((GetItemMinRange(item) == 1) && (GetItemMaxRange(item) == 1))
    {
        gUnk_Sio_16.unk_06 = 1;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 2))
    {
        gUnk_Sio_16.unk_06 = 2;
        return;
    }

    if ((GetItemMinRange(item) == 2) && (GetItemMaxRange(item) == 3))
    {
        gUnk_Sio_16.unk_06 = 2;
        return;
    }

    item = GetUnitEquippedWeapon(GetUnit(gUnk_42[gUnk_Sio_16.unk_05]));

    if (item == 0)
    {
        gUnk_Sio_16.unk_06 = 1;
        return;
    }

    if (GetItemMinRange(item) >= 2)
    {
        gUnk_Sio_16.unk_06 = 2;
        return;
    }

    gUnk_Sio_16.unk_06 = 1;
    LoadIconPalettes(4);

    return;
}
