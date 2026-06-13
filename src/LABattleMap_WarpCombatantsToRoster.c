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

//! FE8U = 0x0804A7C0
void LABattleMap_WarpCombatantsToRoster(ProcPtr proc)
{
    u8 unitIdA = gUnk_42[gUnk_Sio_16.unk_04];
    u8 unitIdB = gUnk_42[gUnk_Sio_16.unk_05];

    struct Unit * unitA = GetUnit(unitIdA);
    struct Unit * unitB = GetUnit(unitIdB);

    int flag = 0;

    int indexA = LinkArenaBattleMap_FindUnitSlot(unitIdA);
    int indexB = LinkArenaBattleMap_FindUnitSlot(unitIdB);

    gUnk_46[1] = NULL;
    gUnk_46[0] = NULL;

    if (((unitA->state & (US_DEAD | US_BIT16)) != 0) || (unitA->pCharacterData == NULL))
    {
        gUnk_Sio_16.unk_0A[unitIdA >> 6]--;
    }
    else
    {
        gUnk_46[0] = (void *)StartMu(unitA);
        DisableMuCamera(gUnk_46[0]);

        unitA->state |= US_HIDDEN;

        flag = 1;

        StartSioWarpFx(
            unitA, gUnk_46[0], gSioPoints_2[indexA].x, gSioPoints_2[indexA].y, 2, flag, proc);
    }

    if (((unitB->state & (US_DEAD | US_BIT16)) != 0) || (unitB->pCharacterData == NULL))
    {
        gUnk_Sio_16.unk_0A[unitIdB >> 6]--;
    }
    else
    {
        gUnk_46[1] = (void *)StartMu(unitB);
        DisableMuCamera(gUnk_46[1]);

        unitB->state |= US_HIDDEN;

        if (!flag)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }

        StartSioWarpFx(
            unitB, gUnk_46[1], gSioPoints_2[indexB].x, gSioPoints_2[indexB].y, 2, flag, proc);
    }

    LinkArenaBattleMap_RefreshMapAndSprites();

    Proc_Break(proc);

    return;
}
