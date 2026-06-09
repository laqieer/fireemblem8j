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

//! FE8U = 0x080BAF58
void MapUnitC_AddToPosition(struct GMapUnitContainerProc * container, int index, int x, int y)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    mapUnitProc->x += x;
    mapUnitProc->y += y;

    return;
}
