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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gSioBat_0[];

//! FE8U = 0x0804A614
void LABattleMap_StartCombat(ProcPtr proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (MuExistsActive() == 1)
    {
        return;
    }

    unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
    unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

    HideUnitSprite(unitA);

    gActionData.unitActionType = 2;
    gActionData.targetIndex = gUnk_42[gUnk_Sio_16.unk_05];

    EquipUnitItemSlot(unitA, gUnk_45[3]);
    BattleGenerateReal(unitA, unitB);

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;

    Proc_StartBlocking(gSioBat_0, proc);
    Proc_Break(proc);

    return;
}
