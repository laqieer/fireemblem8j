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

void ExecStandardHeal(ProcPtr proc) {
    int amount;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    AddUnitHp(GetUnit(gActionData.targetIndex), amount);

    gBattleHitIterator->hpChange = gBattleTarget.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.targetIndex));

    gBattleTarget.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.targetIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecRestore(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    if (GetUnit(gActionData.targetIndex)->statusIndex == UNIT_STATUS_PETRIFY) {
        SetUnitStatus(GetUnit(gActionData.targetIndex), UNIT_STATUS_NONE);
        GetUnit(gActionData.targetIndex)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);
    }

    SetUnitStatus(GetUnit(gActionData.targetIndex), UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecBarrierStaff(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetUnit(gActionData.targetIndex)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void GetRescueStaffeePosition(struct Unit* unit, struct Unit* target, int* xOut, int* yOut) {
    int foundDist, dist;
    int ix, iy;

    *xOut = -1;
    *yOut = -1;

    foundDist = 9999;

    GenerateUnitExtendedMovementMap(unit);

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > 0x78) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0) {
                continue;
            }

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0) {
                continue;
            }

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix])) {
                continue;
            }

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist) {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0) {
        return;
    }

    foundDist = 9999;

    GenerateExtendedMovementMap(unit->xPos, unit->yPos, TerrainTable_MovCost_FlyNormal);

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > 0x78) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0) {
                continue;
            }

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0) {
                continue;
            }

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix])) {
                continue;
            }

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist) {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0) {
        return;
    }

    *xOut = target->xPos;
    *yOut = target->yPos;

    return;
}

void ExecRescueStaff(ProcPtr proc) {
    int x, y;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetRescueStaffeePosition(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.targetIndex),
        &x,
        &y
    );

    GetUnit(gActionData.targetIndex)->xPos = x;
    GetUnit(gActionData.targetIndex)->yPos = y;

    gBattleTarget.changeHP = x;
    gBattleTarget.changePow = y;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}
