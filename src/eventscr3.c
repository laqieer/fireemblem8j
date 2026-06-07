#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"

#include "constants/items.h"

static u16 ItemBackupEvtBattle;
extern struct Unknown03000600 gUnk_38[0x40];

//! FE8U = 0x08011DF4
void EvtBattleGenerateRealInternal(struct Unit * unitA, struct Unit * unitB)
{
    InitBattleUnit(&gBattleActor, unitA);
    InitBattleUnit(&gBattleTarget, unitB);

    gBattleStats.range =
        RECT_DISTANCE(gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
    {
        SetBattleUnitWeaponBallista(&gBattleActor);
    }
    else
    {
        SetBattleUnitWeapon(&gBattleActor, -1);
    }

    SetBattleUnitWeapon(&gBattleTarget, -1);

    BattleInitTargetCanCounter();

    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(unitA, unitB);

    EnableAllLightRunes();

    BattleUnitTargetCheckCanCounter(&gBattleTarget);
    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    return;
}

//! FE8U = 0x08011EC8
void EvtBattleGenerateReal(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = BATTLE_CONFIG_REAL;
    EvtBattleGenerateRealInternal(unitA, unitB);
}

//! FE8U = 0x08011EDC
void EvtBattleGenerateBallistaReal(struct Unit * unitA, struct Unit * unitB)
{
    gBattleStats.config = (BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA);
    EvtBattleGenerateRealInternal(unitA, unitB);
}
