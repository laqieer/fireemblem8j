#include "global.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "bmidoten.h"
#include "uiselecttarget.h"

void ForEachUnitInMagBy2Range(void(*func)(struct Unit* unit)) {
    int x = gSubjectUnit->xPos;
    int y = gSubjectUnit->yPos;

    InitTargets(x, y);

    MapAddInRange(x, y, GetUnitMagBy2Range(gSubjectUnit), 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);

    return;
}
