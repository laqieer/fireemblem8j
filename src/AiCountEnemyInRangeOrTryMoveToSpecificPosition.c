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
s8 AiTryMoveToSpecificPosition(struct Vec2* out);

s8 AiCountEnemyInRangeOrTryMoveToSpecificPosition(const void* input) {
    int enemiesInRange;
    struct Vec2 pos;

    u16 item = GetUnitEquippedWeapon(gActiveUnit);

    if (item != 0) {
        FillMovementAndRangeMapForItem(gActiveUnit, item);
        enemiesInRange = AiCountEnemyUnitsInRange();
        if (enemiesInRange != 0) {
            gAiState.cmd_result[0] = enemiesInRange;
            return 0;
        }
    } else {
        GenerateUnitMovementMap(gActiveUnit);
    }

    if (AiTryMoveToSpecificPosition(&pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y, 0, 0xff, 1);
        return 1;
    }

    return 0;

}
