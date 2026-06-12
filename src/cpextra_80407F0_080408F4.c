#include "global.h"

#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"


s8 AiFindReachableDoorPosition(struct Unit*, struct Vec2*);
s8 AiFindReachableUnlockPosition(struct Unit*, u32, struct Vec2*, struct Vec2*);
s8 AiTryDoRogueSpecialItems(void);
void InitAiMoveMapForUnit(struct Unit*);
void GenerateUnitExtendedMovementMapOnRange(struct Unit*);
void GenerateUnitExtendedMovementMapOnRangeNeglectDoor(struct Unit*);
void GenerateExtendedMovementMapOnRangeNeglectDoor(struct Unit*);


struct AiSpecialItemLutEntry {
    u16 itemId;
    void(*func)(int itemIdx);
};

void AiSpecialItemDoorKey(int item);
void AiSpecialItemLockpick(int item);
void AiSpecialItemAntitoxin(int item);

extern const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[];

/* file-scope type definitions used by this run */


struct UnknownAiInputA {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
};

struct UnknownAiInputB {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    
    struct UnitDefinition* unk_04;
};

/* prototypes for same-file helpers called by this run */
s8 AiFindReachableUnlockPosition(struct Unit* unit, u32 flags, struct Vec2* posA, struct Vec2* posB);

void AiSpecialItemLockpick(int item) {

    struct Vec2 pos;
    u32 flags = 0;

    if (!(gAiState.specialItemFlags & 2)) {
        return;
    }

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
        if (!(gActiveUnit->aiFlags & 8)) {
            gActiveUnit->aiFlags |= 8;
            gAiState.decideState = 0;

            return;
        }
    }

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)) {
        return;
    }

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
        flags |= 4;
    }

    if ((gActiveUnit->pCharacterData->number == CHARACTER_RENNAC) && (gActiveUnit->aiFlags & 8)) {
        flags |= 8;
    }

    if (AiFindReachableUnlockPosition(gActiveUnit, flags, &pos, 0) == 1) {

        AiTryMoveTowards(pos.x, pos.y, 0, gAiState.unk7E, 0);

        if ((gAiDecision.actionPerformed != 1)) {
            return;
        }

        if ((AiIsWithinRectDistance(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1)) {
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, UNIT_ACTION_STEAL, 0, item, 0, 0);
        }
    }

    return;
}
