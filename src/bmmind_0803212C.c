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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProcScr_ArenaAction[];

//! FE8U = 0x080321E0
s8 ActionDrop(ProcPtr proc) {
    struct AfterDropActionProc* child;

    struct Unit* target = GetUnit(gActionData.targetIndex);

    if (gBmMapHidden[gActionData.yOther][gActionData.xOther] & HIDDEN_BIT_UNIT) {
        gWorkingMovementScript[0] = MOVE_CMD_BUMP;
        gWorkingMovementScript[1] = MOVE_CMD_HALT;
        SetAutoMuMoveScript(gWorkingMovementScript);
        return 0;
    }

    UnitFinalizeMovement(GetUnit(gActionData.subjectIndex));

    Make6CKOIDO(
        target,
        GetSomeFacingDirection(gActionData.xOther, gActionData.yOther, target->xPos, target->yPos),
        2,
        proc
    );

    UnitDrop(
        GetUnit(gActionData.subjectIndex),
        gActionData.xOther,
        gActionData.yOther
    );

    child = Proc_StartBlocking(sProcScr_AfterDropAction, proc);
    child->unit = target;

    return 0;
}

//! FE8U = 0x08032270
s8 ActionVisitAndSeize(ProcPtr proc) {
    int x = GetUnit(gActionData.subjectIndex)->xPos;
    int y = GetUnit(gActionData.subjectIndex)->yPos;

    StartAvailableTileEvent(x, y);

    return 0;
}

//! FE8U = 0x0803229C
s8 ActionCombat(ProcPtr proc) {
    struct Unit* target = GetUnit(gActionData.targetIndex);

    int itemIdx = GetItemIndex(
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    gBattleActor.hasItemEffectTarget = 0;

    if (itemIdx == ITEM_NIGHTMARE) {
        int i;
        int targetCount;

        MakeTargetListForFuckingNightmare(GetUnit(gActionData.subjectIndex));
        targetCount = GetSelectTargetCount();

        for (i = 0; i < targetCount; i++) {
            SetUnitStatus(
                GetUnit(GetTarget(i)->uid),
                UNIT_STATUS_SLEEP
            );
        }
    }

    if (target == 0) {
        InitObstacleBattleUnit();
    }

    if (gActionData.itemSlotIndex == BU_ISLOT_BALLISTA) {
        BattleGenerateBallistaReal(GetUnit(gActionData.subjectIndex), target);
    } else {
        BattleGenerateReal(GetUnit(gActionData.subjectIndex), target);
    }

    Proc_StartBlocking(sProcScr_CombatAction, proc);

    return 0;
}

//! FE8U = 0x08032344
s8 ActionArena(ProcPtr proc) {
    Proc_StartBlocking(sProcScr_ArenaAction, proc);
    return 0;
}

//! FE8U = 0x08032358
s8 ActionDance(ProcPtr proc) {
    GetUnit(gActionData.targetIndex)->state &= ~( US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI );

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex), -1);
    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    gBattleStats.config = BATTLE_CONFIG_REFRESH;

    BattleApplyMiscAction(proc);
    BeginBattleAnimations();

    return 0;
}

//! FE8U = 0x080323A8
s8 ActionTalk(ProcPtr proc) {
    StartCharacterEvent(
        GetUnit(gActionData.subjectIndex)->pCharacterData->number,
        GetUnit(gActionData.targetIndex)->pCharacterData->number
    );

    return 0;
}

//! FE8U = 0x080323D4
s8 ActionSupport(ProcPtr proc) {
    int subjectExp;
    int targetExp;

    struct Unit* target = GetUnit(gActionData.targetIndex);

    int targetSupportNum = GetUnitSupporterNum(gActiveUnit, target->pCharacterData->number);
    int subjectSupportNum = GetUnitSupporterNum(target, gActiveUnit->pCharacterData->number);

    CanUnitSupportNow(target, subjectSupportNum);

    UnitGainSupportLevel(gActiveUnit, targetSupportNum);
    UnitGainSupportLevel(target, subjectSupportNum);

    StartSupportTalk(
        gActiveUnit->pCharacterData->number,
        target->pCharacterData->number,
        GetUnitSupportLevel(gActiveUnit, targetSupportNum)
    );

    subjectExp = gActiveUnit->supports[targetSupportNum];
    targetExp = target->supports[subjectSupportNum];

    if (subjectExp != targetExp) {
        if (subjectExp > targetExp) {
            target->supports[subjectSupportNum] = subjectExp;
        }

        if (subjectExp < targetExp) {
            gActiveUnit->supports[targetSupportNum] = targetExp;
        }
    }

    return 0;
}

//! FE8U = 0x0803247C
s8 ActionSteal(ProcPtr proc) {
    int item;

    struct Unit* target = GetUnit(gActionData.targetIndex);

    if (target->state & US_DROP_ITEM) {
        if (gActionData.itemSlotIndex == (GetUnitItemCount(target) - 1)) {
            target->state &= ~US_DROP_ITEM;
        }
    }

    item = GetUnit(gActionData.targetIndex)->items[gActionData.itemSlotIndex];

    UnitRemoveItem(GetUnit(gActionData.targetIndex), gActionData.itemSlotIndex);

    switch (ITEM_INDEX(item)) {
        case ITEM_1G:
        case ITEM_5G:
        case ITEM_10G:
        case ITEM_50G:
        case ITEM_100G:
        case ITEM_150G:
        case ITEM_200G:
        case ITEM_3000G:
        case ITEM_5000G:
            SetPartyGoldAmount(GetPartyGoldAmount() + GetItemCost(item));
            break;

        default:
            UnitAddItem(GetUnit(gActionData.subjectIndex), item);
            break;
    }

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex), -1);
    gBattleTarget.terrainId = TERRAIN_PLAINS;
    InitBattleUnit(&gBattleTarget, GetUnit(gActionData.targetIndex));
    gBattleTarget.weapon = item;
    BattleApplyMiscAction(proc);

    EndAllMus();
    BeginMapAnimForSteal();

    return 0;
}

//! FE8U = 0x08032554
s8 ActionSummon(ProcPtr proc) {
    InitBattleUnit(&gBattleActor, gActiveUnit);

    BattleApplyMiscAction(proc);
    EndAllMus();
    BeginMapAnimForSummon();

    return 0;
}

//! FE8U = 0x08032580
s8 ActionSummonDK(ProcPtr proc) {
    InitBattleUnit(&gBattleActor, gActiveUnit);

    BattleApplyMiscAction(proc);
    EndAllMus();
    BeginMapAnimForSummonDK();

    return 0;
}

//! FE8U = 0x080325AC
void DeathDropSpriteAnim_Loop(struct DeathDropAnimProc* proc) {
    int x = Interpolate(INTERPOLATE_LINEAR, proc->xFrom, proc->xTo, proc->clock, proc->clockEnd);
    int y = Interpolate(INTERPOLATE_LINEAR, proc->yFrom, proc->yTo, proc->clock, proc->clockEnd);

    y += proc->yOffset;

    proc->yOffset += proc->ySpeed;
    proc->ySpeed += proc->yAccel;

    PutUnitSprite(
        7,
        x - gBmSt.camera.x,
        y - gBmSt.camera.y,
        proc->unit
    );

    ++proc->clock;

    if (proc->clock == proc->clockEnd) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08032658
void DeathDropSpriteAnim_ExecAnyTrap(struct DeathDropAnimProc * proc)
{
    ExecTrapAfterDeathDrop(proc, proc->unit);
}
