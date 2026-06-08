#include "global.h"

#include "proc.h"
#include "rng.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "mu.h"
#include "uiselecttarget.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmusemind.h"
#include "bmtrap.h"
#include "bmarch.h"
#include "bmtarget.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "popup.h"
#include "eventinfo.h"
#include "mapanim.h"

#include "bmmind.h"

#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

EWRAM_DATA struct ActionData gActionData = { 0 };









/* prototypes for same-file helpers called by this run */
s8 ActionDrop(ProcPtr proc);
s8 ActionVisitAndSeize(ProcPtr proc);
s8 ActionCombat(ProcPtr proc);
s8 ActionArena(ProcPtr proc);
s8 ActionDance(ProcPtr proc);
s8 ActionTalk(ProcPtr proc);
s8 ActionSupport(ProcPtr proc);
s8 ActionSteal(ProcPtr proc);
s8 ActionSummon(ProcPtr proc);
s8 ActionSummonDK(ProcPtr proc);

//! FE8U = 0x08031FEC
void StoreRNStateToActionStruct(void) {
    StoreRNState(gActionData._u00);
    return;
}

//! FE8U = 0x08031FFC
void LoadRNStateFromActionStruct(void) {
    LoadRNState(gActionData._u00);
    return;
}

//! FE8U = 0x0803200C
u32 ApplyUnitAction(ProcPtr proc) {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    if (gActionData.unitActionType == UNIT_ACTION_COMBAT) {
        int itemIdx = GetItemIndex(
            GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
        );

        if (itemIdx == ITEM_NIGHTMARE) {
            ActionStaffDoorChestUseItem(proc);
            return 0;
        }
    }

    switch (gActionData.unitActionType) {
        case UNIT_ACTION_WAIT:
        case UNIT_ACTION_TRAPPED:
            gActiveUnit->state |= US_HAS_MOVED;
            return 1;

        case UNIT_ACTION_RESCUE:
            return ActionRescue(proc);

        case UNIT_ACTION_DROP:
            return ActionDrop(proc);

        case UNIT_ACTION_VISIT:
        case UNIT_ACTION_SEIZE:
            return ActionVisitAndSeize(proc);

        case UNIT_ACTION_COMBAT:
            return ActionCombat(proc);

        case UNIT_ACTION_DANCE:
            return ActionDance(proc);

        case UNIT_ACTION_TALK:
            return ActionTalk(proc);

        case UNIT_ACTION_SUPPORT:
            return ActionSupport(proc);

        case UNIT_ACTION_STEAL:
            return ActionSteal(proc);

        case UNIT_ACTION_SUMMON:
            return ActionSummon(proc);

        case UNIT_ACTION_SUMMON_DK:
            return ActionSummonDK(proc);

        case UNIT_ACTION_ARENA:
            return ActionArena(proc);

        case UNIT_ACTION_STAFF:
        case UNIT_ACTION_DOOR:
        case UNIT_ACTION_CHEST:
        case UNIT_ACTION_USE_ITEM:
            ActionStaffDoorChestUseItem(proc);
            return 0;

        case UNIT_ACTION_PICK:
            ActionPick(proc);
            return 0;

        default:
            return 1;
    }
}

//! FE8U = 0x08032164
s8 ActionRescue(ProcPtr proc) {
    struct Unit* subject = GetUnit(gActionData.subjectIndex);
    struct Unit* target = GetUnit(gActionData.targetIndex);

    TryRemoveUnitFromBallista(target);

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(subject->xPos, subject->yPos, target->xPos, target->yPos),
        0,
        proc
    );

    UnitRescue(subject, target);
    HideUnitSprite(target);

    return 0;
}

//! FE8U = 0x080321B8
int AfterDrop_CheckTrapAfterDropMaybe(struct AfterDropActionProc* proc) {
    return ExecTrapAfterDropAction(proc, proc->unit);
}
