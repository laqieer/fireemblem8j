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

s8 AiTryDKSummon(struct UnknownAiInputB* input) {
    int ix;
    int iy;

    int numValidTargets;
    int numHit;

    int totalSummonedUnits = 0;

    if (gPlaySt.chapterTurnNumber == 1) {
        gAiState.cmd_result[0] = 1;
        gAiState.cmd_result[1] = gActiveUnit->xPos;
        gAiState.cmd_result[2] = gActiveUnit->yPos;
        return 0;
    }

    BmMapFill(gBmMapRange, 0);
    MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, GetItemMinRange(ITEM_NIGHTMARE), GetItemMaxRange(ITEM_NIGHTMARE));

    AiDetermineNightmareEffectiveness(&numValidTargets, &numHit, 0);

    if (numValidTargets >= input->unk_00) {

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                struct Unit* unit;
                struct UnitDefinition* iter;

                u8 unitId = gBmMapUnit[iy][ix];
                
                if (unitId == 0) {
                    continue;
                }
                
                if (unitId == gActiveUnitId) {
                    continue;
                }
                
                if (!AreUnitsAllied(gActiveUnitId, unitId)) {
                    continue;
                }

                unit = GetUnit(unitId);

                for (iter = input->unk_04; iter->charIndex != 0; ++iter) {
                    if (unit->pCharacterData->number != iter->charIndex) {
                        continue;
                    } 
                    
                    if (unit->pClassData->number != iter->classIndex) {
                        continue;
                    }

                    totalSummonedUnits++;
                    break;
                }
            }
        }

        if (totalSummonedUnits < input->unk_01) {
            gAiState.cmd_result[0] = 1;
            gAiState.cmd_result[1] = gActiveUnit->xPos;
            gAiState.cmd_result[2] = gActiveUnit->yPos;
            return 0;
        }
    }

    gAiState.cmd_result[0] = 0;
    return 0;
}
