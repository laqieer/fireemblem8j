#include "global.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "bmlib.h"
#include "bmmind.h"
#include "variables.h"

extern struct PathArrowProc * gpPathArrowProc;

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

void CutOffPathLength(s8 newIndexArg) {
    int newIndex = newIndexArg;
    if (gpPathArrowProc->pathLen >= newIndex) {
        int i;
        gpPathArrowProc->pathLen = newIndex - 1;
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
            gpPathArrowProc->maxMov;
        for (i = 1; i <= gpPathArrowProc->pathLen; i = (s8)(i + 1)) {
            u8 *costs = GetWorkingMoveCosts();
            gpPathArrowProc->pathCosts[i] =
                gpPathArrowProc->pathCosts[i - 1] -
                costs[TERRAIN_AT(
                    gpPathArrowProc->pathX[i],
                    gpPathArrowProc->pathY[i])];
        }
    }
}
