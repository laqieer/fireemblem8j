#include "global.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtarget.h"
#include "uiselecttarget.h"

void ForEachPosInRange(void (* func)(int x, int y));

void ForEachPosAtSinglePosition(int x, int y, void(*func)(int x, int y)) {
    s8 ix;
    s8 iy;

    InitTargets(x, y);

    for (iy = -1; iy < 2; iy++) {
        for (ix = -1; ix < 2; ix++) {
            if ((x >= 0) && (y >= 0)) {
                gWorkingBmMap[y][x]++;
            }
        }
    }

    ForEachPosInRange(func);

    return;
}
