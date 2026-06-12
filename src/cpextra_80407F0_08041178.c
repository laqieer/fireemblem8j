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
int AiDetermineNightmareEffectiveness(int* numValidTargets, int* numHit, u8 threshold);

s8 AiTryUseNightmareStaff(struct UnknownAiInputA* input) {
    int ix;
    int iy;
    int itemIdx;

    u8 targetUnitId;
    int numValidTargets;
    int numHit;

    int countA;
    int bestNumHit;
    int countB;
    int uidBest;
    int xBest;
    int yBest;

    s8 foundItem = 0;

    countA = 0;
    bestNumHit = 0;
    countB = 0;
    xBest = 0;
    yBest = 0;

    if (gPlaySt.chapterTurnNumber < 2) {
        gAiState.cmd_result[0] = 0;
        gAiState.cmd_result[1] = 0;

        return 0;
    } else {

        for (itemIdx = 0; itemIdx < UNIT_ITEM_COUNT; itemIdx++) {
            u16 item = gActiveUnit->items[itemIdx];

            if (item == 0) {
                break;
            }
            
            if (GetItemIndex(item) == ITEM_NIGHTMARE) {
                foundItem = 1;
                break;
            }
        }

        if (foundItem) {
            AiGenerateUnitMovementMapRespectStay(gActiveUnit);
            GenerateMagicSealMap(-1);

            for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
                for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                    if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                        continue;
                    }

                    if ((gBmMapUnit[iy][ix] != 0) && (gBmMapUnit[iy][ix] != gActiveUnitId)) {
                        continue;
                    }

                    BmMapFill(gBmMapRange, 0);
                    MapAddInBoundedRange(ix, iy, GetItemMinRange(ITEM_NIGHTMARE), GetItemMaxRange(ITEM_NIGHTMARE));

                    targetUnitId = AiDetermineNightmareEffectiveness(&numValidTargets, &numHit, input->unk_02);

                    if (numValidTargets > countB) {
                        countB = numValidTargets;
                    }

                    if (numValidTargets < input->unk_00) {
                        continue;
                    }

                    if (numHit < input->unk_01) {
                        continue;
                    }

                    if (numHit > bestNumHit) {
                        countA = numValidTargets;
                        bestNumHit = numHit;
                        xBest = ix;
                        yBest = iy;

                        uidBest = targetUnitId;
                    }
                }
            }

            if (countA >= input->unk_01) {
                gAiState.cmd_result[0] = 1;
                gAiState.cmd_result[1] = xBest;
                gAiState.cmd_result[2] = yBest;
                gAiState.cmd_result[3] = uidBest;
                gAiState.cmd_result[4] = itemIdx;
                gAiState.cmd_result[5] = countB;
            } else {
                gAiState.cmd_result[0] = 0;
                gAiState.cmd_result[1] = countB;
            }

            return 0;
        }
    }

    // return 0; BUG? No explicit return if foundItem is false
}
