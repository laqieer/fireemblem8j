#include "global.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "variables.h"

void AddPointToPathArrowProc(s8 x, s8 y) {
    u8 * costs;
    gpPathArrowProc->pathLen++;
    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] = x;
    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] = y;
    costs = GetWorkingMoveCosts();
    gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen - 1] -
        costs[gBmMapTerrain[y][x]];
}
