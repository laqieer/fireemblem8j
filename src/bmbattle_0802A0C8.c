#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

void BattleApplyUnitUpdates(void);
void BattleInitTargetCanCounter(void);
void BattlePrintDebugUnitInfo(struct BattleUnit* actor, struct BattleUnit* target);

void BattleGenerateSimulationInternal(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot) {
    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    gBattleActor.unit.xPos = x;
    gBattleActor.unit.yPos = y;

    gBattleStats.range = RECT_DISTANCE(
        gBattleActor.unit.xPos, gBattleActor.unit.yPos,
        gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleActor);
    else
        SetBattleUnitWeapon(&gBattleActor, actorWpnSlot);

    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(actor, target);

    EnableAllLightRunes();
}

void BattleGenerateRealInternal(struct Unit* actor, struct Unit* target) {
    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    gBattleStats.range = RECT_DISTANCE(
        gBattleActor.unit.xPos, gBattleActor.unit.yPos,
        gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleActor);
    else
        SetBattleUnitWeapon(&gBattleActor, BU_ISLOT_AUTO);

    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(actor, target);

    EnableAllLightRunes();

    BattleUnitTargetCheckCanCounter(&gBattleTarget);
    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    if (gBattleTarget.unit.index) {
        BattleApplyExpGains();
        PidStatsRecordBattleRes();

        PidStatsAddBattleAmt(actor);
        PidStatsAddBattleAmt(target);
    }
}

void BattleApplyGameStateUpdates(void) {
    BattleApplyUnitUpdates();
    BattleApplyBallistaUpdates();

    BattlePrintDebugUnitInfo(&gBattleActor, &gBattleTarget);
    BattlePrintDebugHitInfo();
}
