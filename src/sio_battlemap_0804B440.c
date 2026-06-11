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

/* prototypes for same-file helpers called by this run */
void LinkArenaBattleMap_RefreshMapAndSprites(void);
void LoadLinkArenaFogPlaceholder(void);

//! FE8U = 0x0804A6A4
void LABattleMap_ApplyCombatResults(ProcPtr proc)
{
    u8 unitIdA = gUnk_42[gUnk_Sio_16.unk_04];
    u8 unitIdB = gUnk_42[gUnk_Sio_16.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    LoadLinkArenaFogPlaceholder();

    gUnk_Sio_16.unk_2c[unitIdA >> 6].newScore = gBattleActor.expGain;
    gUnk_Sio_16.unk_2c[unitIdA >> 6].unitId = unitIdA;
    unitA->exp = 0;

    gUnk_Sio_16.unk_2c[unitIdB >> 6].newScore = gBattleTarget.expGain;
    gUnk_Sio_16.unk_2c[unitIdB >> 6].unitId = unitIdB;
    unitB->exp = 0;

    SetUnitAllItemsUsesToMax(unitA);
    SetUnitAllItemsUsesToMax(unitB);

    SetUnitStatus(unitA, 0);
    SetUnitStatus(unitB, 0);

    EndAllMus();

    if (GetUnitCurrentHp(unitA) != 0)
    {
        ShowUnitSprite(unitA);
        unitA->state &= ~US_HIDDEN;
    }

    LinkArenaBattleMap_RefreshMapAndSprites();
    BG_SetPosition(2, 0, 0);

    if ((GetUnitCurrentHp(unitA) == gBattleActor.hpInitial) && (GetUnitCurrentHp(unitB) == gBattleTarget.hpInitial))
    {
        gUnk_Sio_16.unk_09++;
    }
    else
    {
        gUnk_Sio_16.unk_09 = 0;
    }

    Proc_Break(proc);

    return;
}
