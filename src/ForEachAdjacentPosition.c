#include "global.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtarget.h"
#include "uiselecttarget.h"

void ForEachPosInRange(void(*func)(int x, int y));

void ForEachAdjacentPosition(int x, int y, void(*func)(int x, int y)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);

    return;
}
