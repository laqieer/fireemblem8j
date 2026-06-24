#include "global.h"

#include "constants/terrains.h"

#include "bmitem.h"
#include "bmmap.h"
#include "bmunit.h"

// Local decls (avoid bmidoten.h so the static inline helper below is not
// redeclared as extern). MapAddInBoundedRange is emitted out-of-line by its
// own TU (0x0801B674); here it inlines.
void MapAddInRange(int x, int y, int range, int value);
void GenerateUnitStandingReachRange(struct Unit * unit, int reach);

static inline void MapAddInBoundedRange(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void GenerateUnitStandingReachRange(struct Unit * unit, int reach)
{
    int x = unit->xPos;
    int y = unit->yPos;

    switch (reach)
    {

    case REACH_RANGE1:
        MapAddInBoundedRange(x, y, 1, 1);
        break;

    case REACH_RANGE1 | REACH_RANGE2:
        MapAddInBoundedRange(x, y, 1, 2);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 3);
        break;

    case REACH_RANGE2:
        MapAddInBoundedRange(x, y, 2, 2);
        break;

    case REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 2, 3);
        break;

    case REACH_RANGE3:
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 10);
        break;

    case REACH_RANGE1 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 4);
        break;

    case REACH_MAGBY2:
        MapAddInBoundedRange(x, y, 1, GetUnitMagBy2Range(unit));
        break;

    } // switch (reach)
}
