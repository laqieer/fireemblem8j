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

//! FE8U = 0x080BB018
void MapUnitC_SetLayer(struct GMapUnitContainerProc * container, int index, int layer)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];
    mapUnitProc->ap->objLayer = layer;
    mapUnitProc->unk_2c = layer;
    return;
}

//! FE8U = 0x080BB028
int MapUnitC_GetFaction(struct GMapUnitContainerProc * container, int index)
{
    return container->pMapUnitProcs[index]->faction;
}
