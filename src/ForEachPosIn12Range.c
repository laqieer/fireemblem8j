#include "global.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "bmidoten.h"
#include "uiselecttarget.h"

extern void ForEachPosInRange(void (* func)(int x, int y));

void ForEachPosIn12Range(int x, int y, void(*func)(int x, int y)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 2, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);

    return;
}
