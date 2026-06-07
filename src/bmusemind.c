#include "global.h"

#include "constants/classes.h"
#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "proc.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "rng.h"
#include "uiselecttarget.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmtrick.h"
#include "bmtrap.h"
#include "bmtarget.h"
#include "popup.h"
#include "bmudisp.h"
#include "classchg.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "constants/songs.h"

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);







// lightrunefx.s
void StartLightRuneAnim(ProcPtr, int, int);
void StartLightRuneAnim2(ProcPtr, int, int);

// minefx.s
void StartMineAnim(ProcPtr, int, int);

void ExecVulneraryItem(ProcPtr proc, int amount) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddUnitHp(GetUnit(gActionData.subjectIndex), amount);

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.weaponBefore = ITEM_VULNERARY;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecElixirItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    SetUnitHp(
        GetUnit(gActionData.subjectIndex),
        GetUnitMaxHp(GetUnit(gActionData.subjectIndex))
    );

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecPureWaterItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecTorchItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->torchDuration = 4;

    gActionData.xOther = gActionData.xMove;
    gActionData.yOther = gActionData.yMove;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecAntitoxinItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    SetUnitStatus(GetUnit(gActionData.subjectIndex), UNIT_STATUS_NONE);SetUnitStatus(&gBattleActor.unit, UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecKeyItem() {
    int x, y;

    UnitUpdateUsedItem(
        GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex
    );

    x = GetUnit(gActionData.subjectIndex)->xPos;
    y = GetUnit(gActionData.subjectIndex)->yPos;

    StartAvailableDoorTileEvent(x - 1, y);
    StartAvailableDoorTileEvent(x + 1, y);
    StartAvailableDoorTileEvent(x, y - 1);
    StartAvailableDoorTileEvent(x, y + 1);

    StartAvailableChestTileEvent(x, y);

    PlaySoundEffect(SONG_B1);

    gBattleTarget.statusOut = -1;

    return;
}
