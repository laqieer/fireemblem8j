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

/* prototypes for same-file helpers called by this run */
void ExecUnitPromotion(struct Unit* unit, u8 classId, int itemIdx, s8 unk);

void ExecPromotionToClass1() {
    ExecUnitPromotion(GetUnit(gActionData.subjectIndex), 1, gActionData.itemSlotIndex, 1);
    BeginBattleAnimations();

    return;
}

void ExecUnitDefaultPromotionAndHide(struct Unit* unit, int item) {
    gBattleActor.weaponBefore = gBattleTarget.weaponBefore = item;
    gBattleActor.weapon = gBattleTarget.weapon = item;

    InitBattleUnit(&gBattleTarget, unit);

    ApplyUnitDefaultPromotion(unit);

    InitBattleUnit(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_PROMOTION;

    BeginBattleAnimations();

    unit->state |= US_HIDDEN;

    return;
}
