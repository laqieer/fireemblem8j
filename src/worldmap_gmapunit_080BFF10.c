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
const void * MMS_GetGfx(u16 idx);
const void * MMS_GetROMTCS2(u16 idx);
u8 * GetMapUnitMMSGfxBuffer(int idx);

//! FE8U = 0x080BB0E0
s8 MapUnitC_SetDisplayedClass(struct GMapUnitContainerProc * container, int index, int classId)
{
    struct APHandle * ap;
    struct GMapUnitProc * mapUnitProc;
    int r2;

    mapUnitProc = container->pMapUnitProcs[index];
    if (mapUnitProc->ap != NULL)
    {
        AP_Delete(mapUnitProc->ap);
    }

    r2 = classId;
    if (r2 == 0)
    {
        r2 = mapUnitProc->unk_38;
    }

    if (r2 != mapUnitProc->unk_3a)
    {
        mapUnitProc->unk_3a = r2;
        ap = AP_Create(MMS_GetROMTCS2(r2), 8);
        if (ap == NULL)
        {
            return 0;
        }

        AP_SwitchAnimation(ap, mapUnitProc->animId);
        Decompress(MMS_GetGfx(r2), GetMapUnitMMSGfxBuffer(index));

        ap->pGraphics = GetMapUnitMMSGfxBuffer(index);
        mapUnitProc->unk_30 = container->layer;
        ap->tileBase = container->layer + (index * 4) + (mapUnitProc->pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;
        mapUnitProc->ap = ap;
    }

    return 1;
}
