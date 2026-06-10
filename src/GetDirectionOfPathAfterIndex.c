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

u8 GetDirectionOfPathAfterIndex(u8 i) {
    if (i == gpPathArrowProc->pathLen)
        return 0;
    if (gpPathArrowProc->pathX[i] < gpPathArrowProc->pathX[i + 1])
        return 1;
    if (gpPathArrowProc->pathX[i] > gpPathArrowProc->pathX[i + 1])
        return 3;
    if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i + 1])
        return 2;
    if (gpPathArrowProc->pathY[i] > gpPathArrowProc->pathY[i + 1])
        return 4;
}
