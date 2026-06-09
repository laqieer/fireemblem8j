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

/* prototypes for same-file helpers called by this run */
int GetPaletteIdForAllegience(int faction);

//! FE8U = 0x080BB038
void MapUnitC_SetFaction(struct GMapUnitContainerProc * container, int index, int faction)
{
    int pal;

    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];

    if (faction >= 0)
    {
        mapUnitProc->faction = faction;
    }

    pal = GetPaletteIdForAllegience(mapUnitProc->faction);
    mapUnitProc->pal = pal;
    mapUnitProc->ap->tileBase = container->layer + (index * 4) + (pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;

    return;
}

//! FE8U = 0x080BB078
void MapUnitC_SetPalette(struct GMapUnitContainerProc * container, int index, int pal)
{
    struct GMapUnitProc * mapUnitProc = container->pMapUnitProcs[index];
    mapUnitProc->pal = pal;
    mapUnitProc->ap->tileBase = container->layer + (index * 4) + (pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;
    return;
}

//! FE8U = 0x080BB0A4
void MapUnitC_SetGfxNeedsUpdate(struct GMapUnitContainerProc * container, int index)
{
    struct GMapUnitProc * mapUnitProc;
    int i;

    if (index >= 0)
    {
        mapUnitProc = container->pMapUnitProcs[index];
        mapUnitProc->flags |= GMAPUNIT_FLAG_UPDATEGFX;
        return;
    }

    for (i = 0; i < 7; i++)
    {
        mapUnitProc = container->pMapUnitProcs[i];
        if (mapUnitProc)
        {
            mapUnitProc->flags |= GMAPUNIT_FLAG_UPDATEGFX;
        }
    }

    return;
}
