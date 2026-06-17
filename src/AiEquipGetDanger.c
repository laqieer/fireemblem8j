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

s8 AiIsWithinFlyingDistance(struct Unit*, int, int);
int StoreItemAndGetUnitAttack(struct Unit*, u16*);

void AiEquipGetDanger(int x, int y, u16 * range_danger_out, u16 * melee_danger_out, u16 * combined_danger_out)
{
    int i;
    int might;
    int iy, ix;
    u16 item;

    *combined_danger_out = 0;
    *melee_danger_out = 0;
    *range_danger_out = 0;

    BmMapFill(gBmMapOther, 0);

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_RESCUED))
            continue;

        if (AreUnitsAllied(gActiveUnitId, unit->index))
            continue;

        if (!AiIsWithinFlyingDistance(unit, x, y))
            continue;

        GenerateUnitMovementMap(unit);

        if (gBmMapMovement[y][x] == 0xFF)
            continue;

        might = StoreItemAndGetUnitAttack(unit, &item);

        if (GetItemMinRange(item) > 1)
            *range_danger_out += might;

        if (GetItemMaxRange(item) == 1)
            *melee_danger_out += might;

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                    continue;

                if (gBmMapOther[iy][ix] + might <= 0xFF)
                    gBmMapOther[iy][ix] = gBmMapOther[iy][ix] + might;
                else
                    gBmMapOther[iy][ix] = 0xFF;
            }
        }
    }
    *combined_danger_out = *range_danger_out + *melee_danger_out;
}
