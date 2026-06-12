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

void ExecDanceRing(ProcPtr proc) {
    int status = 0;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    switch (GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex])) {
        case ITEM_FILLAS_MIGHT:
            status = UNIT_STATUS_ATTACK;
            break;
        case ITEM_NINISS_GRACE:
            status = UNIT_STATUS_DEFENSE;
            break;
        case ITEM_THORS_IRE:
            status = UNIT_STATUS_CRIT;
            break;
        case ITEM_SETS_LITANY:
            status = UNIT_STATUS_AVOID;
            break;
    }

    SetUnitStatusExt(GetUnit(gActionData.targetIndex), status, 1);

    gBattleStats.config = BATTLE_CONFIG_DANCERING;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}
