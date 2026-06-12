#include "global.h"
#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"

//! FE8U = 0x080BAFA4
void MapUnitC_SetDisplayEnabled(struct GMapUnitContainerProc * container, int index, char flag)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    if (flag)
    {
        mapUnitProc->flags |= GMAPUNIT_FLAG_DISPLAY;
    }
    else
    {
        mapUnitProc->flags &= ~GMAPUNIT_FLAG_DISPLAY;
    }

    return;
}
