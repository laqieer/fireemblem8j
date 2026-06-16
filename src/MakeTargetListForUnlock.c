#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtarget.h"
#include "bmidoten.h"

void ForEachPosIn12Range(int x, int y, void(*func)(int x, int y));
void TryAddClosedDoorToTargetList(int x, int y);

void MakeTargetListForUnlock(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;
    gSubjectUnit = unit;
    BmMapFill(gBmMapRange, 0);
    ForEachPosIn12Range(x, y, TryAddClosedDoorToTargetList);
    return;
}
