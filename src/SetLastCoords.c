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

void SetLastCoords(u16 x, u16 y) {
    gpPathArrowProc->lastX = x;
    gpPathArrowProc->lastY = y;
}
