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
s8 AiIsUnitAtPositionDifferentAllegiance(int x, int y);

s8 AiFunc_CountEnemiesInRange(const void * arg)
{
    struct AiCountEnemiesInRangeArg const * cast = arg;
    u16 item;
    int ix;
    int iy;
    u16 move;

    u8 count = 0;

    move = (UNIT_MOV(gActiveUnit) * cast->move_coeff_q4);
    move = move >> 4;

    item = GetUnitEquippedWeapon(gActiveUnit);

    if ((cast->attack_range != 0) && item != 0) {
        AiFloodMovementAndRange(gActiveUnit, move, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                if (gMapRangeSigned[iy][ix] == 0) {
                    continue;
                }

                if (AiIsUnitAtPositionDifferentAllegiance(ix, iy) == 1) {
                    count++;
                }
            }
        }
    } else {
        SetWorkingMoveCosts(GetUnitMovementCost(gActiveUnit));
        SetWorkingBmMap(gBmMapRange);

        GenerateMovementMap(gActiveUnit->xPos, gActiveUnit->yPos, move, 0);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                    continue;
                }

                if (AiIsUnitAtPositionDifferentAllegiance(ix, iy) == 1) {
                    count++;
                }
            }
        }
    }

    gAiState.cmd_result[cast->result_slot] = count;
    return 0;
}
