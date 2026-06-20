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

void ExecUnitPromotion(struct Unit* unit, u8 classId, int itemIdx, s8 unk) {
    int v = unk;

    if (itemIdx != -1) {
        gBattleActor.weaponBefore = gBattleTarget.weaponBefore = unit->items[itemIdx];
    }

    gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(unit);

    InitBattleUnitWithoutBonuses(&gBattleTarget, unit);

    ApplyUnitPromotion(unit, classId);

    InitBattleUnitWithoutBonuses(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    if (v) {
        unit->state |= US_HAS_MOVED;
    }

    if (itemIdx != -1) {
        UnitUpdateUsedItem(unit, itemIdx);
    }

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_PROMOTION;

    return;
}
