#include "global.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "variables.h"

s32 GetPointAlongPath(s8 x, s8 y) {
    s8 i;
    for (i = 0; i <= gpPathArrowProc->pathLen; i++) {
        if (gpPathArrowProc->pathX[i] == x && gpPathArrowProc->pathY[i] == y)
            return i;
    }
    return -1;
}
