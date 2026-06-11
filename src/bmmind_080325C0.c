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
extern struct ProcCmd sProcScr_DeathDropAnim[];

//! FE8U = 0x08032674
void DropRescueOnDeath(ProcPtr proc, struct Unit* unit) {
    struct DeathDropAnimProc* child;

    if (GetUnitCurrentHp(unit) != 0) {
        return;
    }

    if (!(unit->state & US_RESCUING)) {
        return;
    }

    child = Proc_StartBlocking(sProcScr_DeathDropAnim, proc);

    child->unit = GetUnit(unit->rescue);

    UnitGetDeathDropLocation(unit, &child->xDrop, &child->yDrop);
    UnitDrop(unit, child->xDrop, child->yDrop);

    child->xFrom = unit->xPos * 16;
    child->yFrom = unit->yPos * 16;
    child->xTo = child->xDrop * 16;
    child->yTo = child->yDrop * 16;
    child->yOffset = 0;
    child->ySpeed = -5;
    child->yAccel = 1;
    child->clock = 0;
    child->clockEnd = 11;

    UseUnitSprite(GetUnitSMSId(child->unit));
    ForceSyncUnitSpriteSheet();

    PlaySoundEffect(SONG_AC);

    return;
}

//! FE8U = 0x08032728
void KillUnitOnCombatDeath(struct Unit* unitA, struct Unit* unitB) {
    if (GetUnitCurrentHp(unitA) != 0) {
        return;
    }

    PidStatsRecordDefeatInfo(unitA->pCharacterData->number, unitB->pCharacterData->number, DEFEAT_CAUSE_COMBAT);

    UnitKill(unitA);

    return;
}

//! FE8U = 0x08032750
void KillUnitOnArenaDeathMaybe(struct Unit* unit) {
    if (GetUnitCurrentHp(unit) != 0) {
        return;
    }

    UnitKill(unit);

    PidStatsRecordDefeatInfo(unit->pCharacterData->number, 0, DEFEAT_CAUSE_ARENA);

    return;
}

//! FE8U = 0x08032774
void BATTLE_GOTO1_IfNobodyIsDead(ProcPtr proc) {
    if (!(gBattleStats.config & BATTLE_CONFIG_MAPANIMS)) {
        if (gBattleActor.unit.curHP == 0) {
            return;
        }

        if (gBattleTarget.unit.curHP == 0) {
            return;
        }
    }

    Proc_Goto(proc, 1);

    return;
}

//! FE8U = 0x080327B4
bool DidUnitDie(struct Unit* unit) {
    if (GetUnitCurrentHp(unit) != 0) {
        return false;
    }

    return true;
}

//! FE8U = 0x080327B4
void BATTLE_PostCombatDeathFades(struct CombatActionProc* proc) {
    struct MuProc* muProc;

    proc->unk_54 = NULL;

    if (DidUnitDie(&gBattleActor.unit)) {
        muProc = Proc_Find(ProcScr_Mu);
        MU_StartDeathFade(muProc);
        proc->unk_54 = muProc;

        TryRemoveUnitFromBallista(&gBattleActor.unit);
    }

    if (DidUnitDie(&gBattleTarget.unit)) {
        struct Unit* target = GetUnit(gBattleTarget.unit.index);
        target->state |= US_HIDDEN;

        TryRemoveUnitFromBallista(target);

        RefreshUnitSprites();
        muProc = StartMu(&gBattleTarget.unit);

        gWorkingMovementScript[0] = GetFacingDirection(gBattleActor.unit.xPos, gBattleActor.unit.yPos, gBattleTarget.unit.xPos, gBattleTarget.unit.yPos);
        gWorkingMovementScript[1] = MOVE_CMD_HALT;

        SetMuMoveScript(muProc, gWorkingMovementScript);
        MU_StartDeathFade(muProc);

        proc->unk_54 = muProc;
    }

    return;
}

//! FE8U = 0x08032860
void BATTLE_DeleteLinkedMOVEUNIT(struct CombatActionProc* proc) {
    EndMu(proc->unk_54);
    return;
}

//! FE8U = 0x0803286C
void BATTLE_HandleCombatDeaths(struct CombatActionProc* proc) {
    struct Unit* unitA = GetUnit(proc->unitIdA);
    struct Unit* unitB = GetUnit(proc->unitIdB);

    DropRescueOnDeath(proc, unitA);
    DropRescueOnDeath(proc, unitB);

    KillUnitOnCombatDeath(unitA, unitB);
    KillUnitOnCombatDeath(unitB, unitA);

    return;
}

//! FE8U = 0x080328B0
void RestoreMapSongBgm(void) {
    int bgmIdx = GetCurrentMapMusicIndex();

    if (GetCurrentBgmSong() != bgmIdx) {
        StartBgmExt(bgmIdx, 6, NULL);
    }

    return;
}

//! FE8U = 0x080328D0
bool BATTLE_HandleItemDrop(struct CombatActionProc* proc) {
    struct Unit* unitA = NULL;
    struct Unit* unitB;

    proc->unitIdA = gBattleActor.unit.index;
    proc->unitIdB = gBattleTarget.unit.index;

    if (gBattleActor.unit.curHP == 0) {
        unitA = GetUnit(gBattleActor.unit.index);
        unitB = GetUnit(gBattleTarget.unit.index);
    }

    if (gBattleTarget.unit.curHP == 0) {
        unitA = GetUnit(gBattleTarget.unit.index);
        unitB = GetUnit(gBattleActor.unit.index);
    }

    if (unitA == NULL) {
        return true;
    }

    if (!(unitA->state & US_DROP_ITEM)) {
        return true;
    }

    if (unitA->items[0] == 0) {
        return true;
    }

    if (UNIT_FACTION(unitB) != FACTION_BLUE) {
        return true;
    }

    NewPopup_GeneralItemGot(
        unitB,
        GetUnitLastItem(unitA),
        proc
    );

    return false;
}

//! FE8U = 0x08032974
void Arena_KeepTargetAlive(ProcPtr proc) {
    gBattleTarget.unit.maxHP = 1;
    gBattleTarget.unit.curHP = 1;

    if (gBattleActor.unit.curHP != 0) {
        Proc_Goto(proc, 1);
    }

    return;
}
