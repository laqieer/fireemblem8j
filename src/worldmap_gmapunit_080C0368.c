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
void MapUnitC_SetDisplayEnabled(struct GMapUnitContainerProc * container, int index, char flag);
void MapUnitC_SetPalette(struct GMapUnitContainerProc * container, int index, int pal);
ProcPtr StartGmapUnitFade(int index, int palA, int palB, int arg3, ProcPtr parent);
ProcPtr GetGmapUnitFade(void);
void GmapUnitFade_AddUnit(int index);

//! FE8U = 0x080BB538
void StartGmapUnitFadeOut(int index, int arg1, ProcPtr parent)
{
    struct GMapUnitContainerProc * containerProc = GM_UNITC;
    struct GMapUnitProc * mapUnitProc = containerProc->pMapUnitProcs[index];

    if (GetGmapUnitFade() == NULL)
    {
        StartGmapUnitFade(index, GetPaletteIdForAllegience(mapUnitProc->faction), -1, arg1, parent);
    }
    else
    {
        GmapUnitFade_AddUnit(index);
    }

    MapUnitC_SetPalette(containerProc, index, 10);
    MapUnitC_SetDisplayEnabled(GM_UNITC, index, 1);

    return;
}
