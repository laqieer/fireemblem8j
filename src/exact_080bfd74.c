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

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

//! FE8U = 0x080BAF44
void MapUnitC_GetPosition(struct GMapUnitContainerProc * container, int index, u16 * x, u16 * y)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    *x = mapUnitProc->x;
    *y = mapUnitProc->y;

    return;
}
