#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProcScr_BattleAnimSimpleLock[];

void BattleApplyItemExpGains(void);
void BattlePrintDebugUnitInfo(struct BattleUnit* actor, struct BattleUnit* target);
void UpdateUnitDuringBattle(struct Unit* unit, struct BattleUnit* bu);

void BattleInitItemEffect(struct Unit* actor, int itemSlot) {
    int item = actor->items[itemSlot];

    if (itemSlot < 0)
        item = 0;

    gBattleStats.config = 0;

    InitBattleUnit(&gBattleActor, actor);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    ComputeBattleUnitBaseDefense(&gBattleActor);
    ComputeBattleUnitSupportBonuses(&gBattleActor, NULL);

    gBattleActor.battleAttack = 0xFF;
    gBattleActor.battleEffectiveHitRate = 100;
    gBattleActor.battleEffectiveCritRate = 0xFF;

    gBattleActor.weapon = item;
    gBattleActor.weaponBefore = item;
    gBattleActor.weaponSlotIndex = itemSlot;
    gBattleActor.weaponType = GetItemType(item);
    gBattleActor.weaponAttributes = GetItemAttributes(item);

    gBattleActor.canCounter = TRUE;
    gBattleActor.hasItemEffectTarget = FALSE;

    gBattleActor.statusOut = -1;
    gBattleTarget.statusOut = -1;

    ClearBattleHits();
}

void BattleInitItemEffectTarget(struct Unit* unit) {
    InitBattleUnit(&gBattleTarget, unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);
    ComputeBattleUnitBaseDefense(&gBattleTarget);
    ComputeBattleUnitSupportBonuses(&gBattleTarget, NULL);

    gBattleTarget.battleAttack = 0xFF;
    gBattleTarget.battleEffectiveHitRate = 0xFF;
    gBattleTarget.battleEffectiveCritRate = 0xFF;

    gBattleTarget.weaponBefore = 0;

    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    gBattleActor.hasItemEffectTarget = TRUE;
}

void UpdateActorFromBattle(void) {
    UpdateUnitFromBattle(GetUnit(gBattleActor.unit.index), &gBattleActor);
}

void BattleApplyMiscAction(struct Proc* proc) {
    BattleApplyMiscActionExpGains();
    Proc_StartBlocking(sProcScr_BattleAnimSimpleLock, proc);
}

void BattleApplyItemEffect(struct Proc* proc) {
    (++gBattleHitIterator)->info = BATTLE_HIT_INFO_END;

    BattleApplyItemExpGains();

    if (gBattleActor.canCounter) {
        if (GetItemAttributes(gBattleActor.weapon) & IA_STAFF)
            gBattleActor.weaponBroke = TRUE;

        gBattleActor.weapon = GetItemAfterUse(gBattleActor.weapon);
        gBattleActor.unit.items[gBattleActor.weaponSlotIndex] = gBattleActor.weapon;

        if (gBattleActor.weapon)
            gBattleActor.weaponBroke = FALSE;
    }

    Proc_StartBlocking(sProcScr_BattleAnimSimpleLock, proc);
}

int GetOffensiveStaffAccuracy(struct Unit* actor, struct Unit* target) {
    int baseAccuracy = (GetUnitPower(actor) - GetUnitResistance(target)) * 5;
    int unitSkill = GetUnitSkill(actor);
    int distance = RECT_DISTANCE(actor->xPos, actor->yPos, target->xPos, target->yPos);

    int result;

    if (actor->pClassData->number == CLASS_DEMON_KING)
        result = (baseAccuracy + unitSkill) - distance * 2;
    else
        result = (baseAccuracy + 30 + unitSkill) - distance * 2;

    if ((target->pClassData->number == CLASS_DEMON_KING) || (target->pCharacterData->number == CHARACTER_LYON) || (target->pCharacterData->number == CHARACTER_LYON_FINAL))
        return 0;

    if (result < 0)
        result = 0;

    if (result > 100)
        result = 100;

    return result;
}

void BattleGenerateArena(struct Unit* actor) {
    struct Unit* target = gArenaState.opponentUnit;
    int something = gBmSt.just_resumed;

    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_ARENA;

    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    if (gActionData.trapType) {
        gBattleTarget.unit.curHP = gActionData.trapType;
        gBattleTarget.hpInitial = gActionData.trapType;
    }

    gBattleStats.range = gArenaState.range;

    gBattleTarget.unit.xPos = gBattleActor.unit.xPos + gArenaState.range;
    gBattleTarget.unit.yPos = gBattleActor.unit.yPos;

    SetBattleUnitWeapon(&gBattleActor, BU_ISLOT_ARENA_PLAYER);
    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_ARENA_OPPONENT);

    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    gActionData.suspendPointType = SUSPEND_POINT_DURINGARENA;
    WriteSuspendSave(SAVE_ID_SUSPEND);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonuses(&gBattleTarget, 8); // TODO: terrain id constants

    BattleGenerate(actor, target);

    if (gBattleTarget.unit.curHP == 0)
        BattleApplyExpGains();

    UpdateUnitDuringBattle(actor, &gBattleActor);

    if (!something || (gBattleTarget.unit.curHP == 0)) {
        PidStatsRecordBattleRes();

        actor->state = (actor->state &~ (US_BIT17 | US_BIT18 | US_BIT19))
            + ((((UNIT_ARENA_LEVEL(actor) + 1) <= 7) ? (UNIT_ARENA_LEVEL(actor) + 1) << 17 : 7 << 17));

        gUnk_63 = UNIT_ARENA_LEVEL(actor);
    }

    BattlePrintDebugUnitInfo(&gBattleActor, &gBattleTarget);
}
