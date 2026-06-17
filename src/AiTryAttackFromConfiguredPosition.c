#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"


struct Unknown_Sub80315C {
    u8* unk_00;
    u8 unk_04;
    u8 unk_05;
};
struct UnknownSub803F4A4 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
};

s8 AiTryAttackFromConfiguredPosition(const struct Unknown_Sub80315C* input) {
    u16 item;
    int ix;
    int iy;
    int xUnk;
    int yUnk;
    u16 move;
    int xPrev;
    int yPrev;

    move = UNIT_MOV(gActiveUnit) * input->unk_04;
    move = move >> 4;

    item = GetUnitEquippedWeapon(gActiveUnit);

    xUnk = input->unk_00[((gActiveUnit->ai_config & 0x1fc0) >> 8)*2+0];
    yUnk = input->unk_00[((gActiveUnit->ai_config & 0x1fc0) >> 8)*2+1];

    xPrev = gActiveUnit->xPos;
    yPrev = gActiveUnit->yPos;

    gActiveUnit->xPos = xUnk;
    gActiveUnit->yPos = yUnk;

    if ((input->unk_05 != 0) && (item != 0)) {
        AiFloodMovementAndRange(gActiveUnit, move, item);

        if (gMapRangeSigned[yUnk][xUnk] == 0) {
            gActiveUnit->xPos = xPrev;
            gActiveUnit->yPos = yPrev;
            AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
            return 1;
        }

    } else {
        SetWorkingMoveCosts(GetUnitMovementCost(gActiveUnit));

        SetWorkingBmMap(gBmMapRange);
        GenerateMovementMap(gActiveUnit->xPos, gActiveUnit->yPos, move, 0);
        if (gBmMapRange[yUnk][xUnk] > MAP_MOVEMENT_MAX) {
            gActiveUnit->xPos = xPrev;
            gActiveUnit->yPos = yPrev;
            AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
            return 1;
        }
    }

    gActiveUnit->xPos = xPrev;
    gActiveUnit->yPos = yPrev;

    GenerateUnitMovementMap(gActiveUnit);
    if (UnitHasMagicRank(gActiveUnit) != 0) {
        GenerateMagicSealMap(-1);
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (item != 0) {
                if ((gMapMovementSigned[iy][ix] < MAP_MOVEMENT_MAX) && (gMapRangeSigned[iy][ix] != 0) ) {
                    continue;
                }

                gMapMovementSigned[iy][ix] = -1;
            } else {
                if ((gMapMovementSigned[iy][ix] < MAP_MOVEMENT_MAX) && (gMapRangeSigned[iy][ix] < MAP_MOVEMENT_MAX) ) {
                    continue;
                }

                gMapMovementSigned[iy][ix] = -1;
            }

        }
    }

    AiAttemptCombatWithinMovement(AiIsUnitEnemy);
    if (gAiDecision.actionPerformed == 1) {
        return 1;
    }

    AiTryMoveTowards(xUnk, yUnk, 0, 0xff, 1);
    return 1;
}
