#include "global.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtarget.h"
#include "uiselecttarget.h"

void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);

    return;
}
