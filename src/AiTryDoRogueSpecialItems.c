#include "global.h"
s8 AiFindClosestChestPosition(struct Unit* unit, struct Vec2* pos);
s8 AiFindReachableUnlockPosition(struct Unit* unit, u32 flags, struct Vec2* posA, struct Vec2* posB);
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

s8 AiTryDoRogueSpecialItems() {
    int flags;
    struct Vec2 posA;
    struct Vec2 posB;

    flags = 0;

    if (gActiveUnit->pClassData->number != CLASS_ROGUE) {
        return 0;
    } else {
        if ((GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) && !(gActiveUnit->aiFlags & 8)) {
            gActiveUnit->aiFlags |= 8;
            gAiState.decideState = 0;
            // BUG? No explicit return statement
        } else {

            if (gPlaySt.chapterIndex == 0xE) {

                if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
                    flags |= 0xC;
                }

                if (AiFindReachableUnlockPosition(gActiveUnit, flags, &posA, &posB) == 1) {
                    AiTryMoveTowards(posA.x, posA.y, 0, gAiState.unk7E, 0);

                    if (gAiDecision.actionPerformed == 1) {
                        if (AiIsWithinRectDistance(posA.x, posA.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1) {
                            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_PICK, 0, 0, posB.x, posB.y);
                            return 1;
                        }
                    }
                }
            } else {
                if ((GetUnitItemCount(gActiveUnit) < UNIT_ITEM_COUNT) && (AiFindClosestChestPosition(gActiveUnit, &posA) == 1)) {
                    AiTryMoveTowards(posA.x, posA.y, 0, gAiState.unk7E, 0);

                    if (gAiDecision.actionPerformed == 1) {
                        if (AiIsWithinRectDistance(posA.x, posA.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1) {
                            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_PICK, 0, 0, gAiDecision.xMove, gAiDecision.yMove);
                            return 1;
                        }
                    }
                }
            }
            return 0;
        }
    }
}
