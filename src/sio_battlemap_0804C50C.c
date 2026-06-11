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

//! FE8U = 0x0804B76C
void LABattleMap_AwardBonusPoints(struct SioBattleMapProc * proc)
{
    struct Unit * unit;

    while (1)
    {
        if (proc->unk_5c > 4)
        {
            CloseHelpBox();
            Proc_Break(proc);
            return;
        }

        unit = GetUnit(proc->unk_58 * 0x40 + proc->unk_5c + 1);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            proc->unk_5c++;
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            proc->unk_5c++;
            continue;
        }

        break;
    }

    gUnk_Sio_16.unk_2c[proc->unk_58].newScore = 30;
    gUnk_Sio_16.unk_2c[proc->unk_58].unitId = proc->unk_58 * 0x40 + proc->unk_5c + 1;

    StartLinkArenaShowPoints(proc);

    proc->unk_5c++;

    return;
}

//! FE8U = 0x0804B7E4
void LABattleMap_SkipIfSingleConsoleMode(ProcPtr proc)
{
    if (gLinkArenaSt.unk_00 == 1)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x0804B800
void LABattle_BeginAnims(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    RenderBmMap();

    if (EkrBattleStarting_IsBattleAnimEnabled())
    {
        SetBanimLinkArenaFlag(1);
        BeginAnimsOnBattleAnimations();

        return;
    }

    EndAllMus();
    RenderBmMap();

    BeginBattleMapAnims();
    gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;

    return;
}

//! FE8U = 0x0804B850
void LABattle_StartDeathFades(struct SioBattleMapProc * proc)
{
    struct MuProc * mu;

    if (gBattleActor.unit.curHP == 0)
    {
        mu = Proc_Find(ProcScr_Mu);
        StartLinkArenaMUDeathFade(mu);
        proc->unk_54 = mu;
    }

    if (gBattleTarget.unit.curHP == 0)
    {
        RefreshUnitSprites();

        HideUnitSprite(GetUnit(gBattleTarget.unit.index));

        mu = StartMu(&gBattleTarget.unit);

        gWorkingMovementScript[0] = GetFacingDirection(
            gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
        gWorkingMovementScript[1] = MOVE_CMD_HALT;

        SetMuMoveScript(mu, gWorkingMovementScript);
        StartLinkArenaMUDeathFade(mu);

        proc->unk_54 = mu;
    }

    return;
}

//! FE8U = 0x0804B8D0
void LABattle_MarkDeadCombatants(void)
{
    struct Unit * unitA = GetUnit(gBattleActor.unit.index);
    struct Unit * unitB = GetUnit(gBattleTarget.unit.index);

    if (GetUnitCurrentHp(unitA) == 0)
    {
        unitA->state |= (US_HIDDEN | US_DEAD);
    }

    if (GetUnitCurrentHp(unitB) == 0)
    {
        unitB->state |= (US_HIDDEN | US_DEAD);
    }

    return;
}
