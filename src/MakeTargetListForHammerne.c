#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtarget.h"
#include "bmidoten.h"

void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit));
void TryAddUnitToHammerneTargetList(struct Unit* unit);

void MakeTargetListForHammerne(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;
    gSubjectUnit = unit;
    BmMapFill(gBmMapRange, 0);
    ForEachAdjacentUnit(x, y, TryAddUnitToHammerneTargetList);
    return;
}
