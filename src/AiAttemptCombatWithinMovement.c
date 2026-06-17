#include "global.h"
#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"
#include "constants/items.h"


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

s8 AiAttemptCombatWithinMovement(s8 (* isEnemy)(struct Unit * unit))
{
    struct AiCombatSimulationSt tmpResult;
    struct AiCombatSimulationSt finalResult;

    int i;

    finalResult.targetId = 0;
    finalResult.score = 0;

    if (gActiveUnit->state & US_IN_BALLISTA) {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) == 0) {
            TryRemoveUnitFromBallista(gActiveUnit);
            goto else_stmt;
        }
    }
    else
    {
else_stmt:
        SetWorkingBmMap(gBmMapRange);

        for (i = 0; i < UNIT_ITEM_COUNT; i++) {
            u16 item = gActiveUnit->items[i];

            if (item == 0) {
                break;
            }

            if (item == ITEM_NIGHTMARE) {
                continue;
            }

            if (!CanUnitUseWeapon(gActiveUnit, item)) {
                continue;
            }

            tmpResult.itemSlot = i;

            {
                int uid;
                for (uid = 1; uid < 0xC0; uid++) {
                    struct Unit* unit = GetUnit(uid);

                    if (!UNIT_IS_VALID(unit)) {
                        continue;
                    }

                    if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
                        continue;
                    }

                    if (!isEnemy(unit)) {
                        continue;
                    }

                    if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item)) {
                        continue;
                    }

                    AiFillReversedAttackRangeMap(unit, item);

                    tmpResult.targetId = unit->index;

                    if (!AiSimulateBestBattleAgainstTarget(&tmpResult)) {
                        continue;
                    }

                    if (tmpResult.score >= finalResult.score) {
                        finalResult = tmpResult;
                        finalResult.itemSlot = i;
                    }
                }
            }
        }
    }

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE) {
        if (AiAttemptBallistaCombat(isEnemy, &tmpResult) == 1) {
            if (tmpResult.score >= finalResult.score) {
                finalResult = tmpResult;
            }
        }
    }

    if ((finalResult.score != 0) || (finalResult.targetId != 0)) {
        AiSetDecision(finalResult.xMove, finalResult.yMove, AI_ACTION_COMBAT, finalResult.targetId, finalResult.itemSlot, 0, 0);

        if ((s8)finalResult.itemSlot != -1) {
            TryRemoveUnitFromBallista(gActiveUnit);
        }
    }
}
