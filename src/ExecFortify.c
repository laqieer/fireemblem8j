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

void ExecFortify(ProcPtr proc) {
    int i;
    int amount;
    int targetCount;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    MakeTargetListForRangedHeal(GetUnit(gActionData.subjectIndex));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    targetCount = GetSelectTargetCount();

    for (i = 0; i < targetCount; i++) {
        AddUnitHp(GetUnit(GetTarget(i)->uid), amount);
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}
