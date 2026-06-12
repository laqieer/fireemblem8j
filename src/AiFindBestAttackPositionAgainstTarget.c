extern int AiGetAttackPositionScore();
#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"

//! FE8U = 0x0803CFB4
s8 AiFindBestAttackPositionAgainstTarget(int x, int y, struct Vec2* out, u8* itemSlotOut) {
    int slot;

    int xOut = -1;
    int yOut = -1;

    u32 best = 0;

    GenerateUnitMovementMap(gActiveUnit);

    for (slot = 0; slot < 5; slot++) {
        int ix;
        int iy;

        u16 item = gActiveUnit->items[slot];

        if (item == 0) {
            break;
        }

        if (!CanUnitUseWeapon(gActiveUnit, item)) {
            continue;
        }

        BmMapFill(gBmMapRange, 0);
        MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                u32 current;

                if (gBmMapMovement[iy][ix] > 0x78) {
                    continue;
                }

                if (gMapRangeSigned[iy][ix] == 0) {
                    continue;
                }

                if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                    continue;
                }

                current = GetItemMight(item) + AiGetAttackPositionScore(ix, iy);

                if (current > best) {
                    xOut = ix;
                    yOut = iy;
                    best = current;

                    *itemSlotOut = slot;
                }
            }
        }
    }

    if (best == 0) {
        return 0;
    }

    out->x = xOut;
    out->y = yOut;

    return 1;
}
