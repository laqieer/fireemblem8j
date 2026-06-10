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

u8 GetDirectionOfPathBeforeIndex(u8 i) {
    if (i == 0)
        return 0;
    if (gpPathArrowProc->pathX[i - 1] < gpPathArrowProc->pathX[i])
        return 3;
    if (gpPathArrowProc->pathX[i - 1] > gpPathArrowProc->pathX[i])
        return 1;
    if (gpPathArrowProc->pathY[i - 1] < gpPathArrowProc->pathY[i])
        return 4;
    if (gpPathArrowProc->pathY[i - 1] > gpPathArrowProc->pathY[i])
        return 2;
}
