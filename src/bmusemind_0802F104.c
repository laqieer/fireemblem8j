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

void ExecNightmare(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ApplyNightmareEffect() {
    int i;
    int accuracy;
    int targetCount;

    MakeTargetListForFuckingNightmare(GetUnit(gActionData.subjectIndex));

    targetCount = GetSelectTargetCount();

    for (i = 0; i < targetCount; i++) {
        struct Unit* target = GetUnit(GetTarget(i)->uid);

        accuracy = GetOffensiveStaffAccuracy(
            GetUnit(gActionData.subjectIndex),
            target
        );

        if (Roll1RN(accuracy) == 1) {
            if (target->statusIndex == UNIT_STATUS_NONE) {
                SetUnitStatus(target, UNIT_STATUS_SLEEP);
            }
        }
    }

    return;
}

void ExecUnlockStaff(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    gBattleTarget.unit.xPos = gActionData.xOther;
    gBattleTarget.unit.yPos = gActionData.yOther;

    gBattleTarget.changeHP = gActionData.xOther;
    gBattleTarget.changePow = gActionData.yOther;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecHammerne(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetUnit(gActionData.targetIndex)->items[gActionData.trapType]
        =  MakeNewItem(
            GetUnit(gActionData.targetIndex)->items[gActionData.trapType]
        );

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}
