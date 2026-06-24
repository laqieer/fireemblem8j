#include "global.h"

#include "constants/terrains.h"

#include "bmitem.h"
#include "bmmap.h"
#include "bmunit.h"

// Local decls (avoid bmidoten.h so the static inline helper below is not
// redeclared as extern). MapAddInBoundedRange is emitted out-of-line by its
// own TU (0x0801B674); here it inlines.
void MapAddInRange(int x, int y, int range, int value);
void GenerateUnitCompleteStaffRange(struct Unit * unit);

static inline void MapAddInBoundedRange(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void GenerateUnitCompleteStaffRange(struct Unit * unit)
{
    int ix, iy;

    int reach = GetUnitStaffReachBits(unit);
    int magBy2Range = GetUnitMagBy2Range(unit);

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gBmMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gBmMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gBmMapUnit[iy][ix]) \
                    continue; \
                if (gBmMapOther[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (reach)
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_MAGBY2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, magBy2Range);
        })

        break;

    default:
        break;

    } // switch (reach)

    #undef FOR_EACH_IN_MOVEMENT_RANGE
}
