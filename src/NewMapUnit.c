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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapUnit[];
extern const u8 gWorldmapGmapunit_0[];

const void * MMS_GetGfx(u16 idx);

// clang-format on

//! FE8U = 0x080BADF0
int NewMapUnit(struct GMapUnitContainerProc * container, u16 classId, int faction)
{
    struct GMapUnitProc * mapUnitProc;
    struct APHandle * ap;
    int i;

    for (i = 0; i < 7; i++)
    {
        if (container->pMapUnitProcs[i] == NULL)
        {
            break;
        }
    }

    if (i == 7)
    {
        return -1;
    }

    mapUnitProc = Proc_Start(ProcScr_GmapUnit, container->proc_parent);
    if (mapUnitProc == NULL)
    {
        return -2;
    }

    mapUnitProc->unk_2e = 0x800;
    mapUnitProc->faction = faction;
    mapUnitProc->pal = GetPaletteIdForAllegience(mapUnitProc->faction);
    mapUnitProc->index = i;
    mapUnitProc->unk_38 = classId;
    mapUnitProc->unk_3a = classId;

    StartWorldMapSMS(GetClassSMSId(classId), mapUnitProc->index, gWorldmapGmapunit_0[mapUnitProc->index]);
    mapUnitProc->unk_2c = 8;

    ap = AP_Create(MMS_GetROMTCS2(classId), 8);

    if (ap == NULL)
    {
        Proc_End(ProcScr_GmapUnit);
        return -3;
    }

    AP_SwitchAnimation(ap, mapUnitProc->animId);

    Decompress(MMS_GetGfx(classId), GetMapUnitMMSGfxBuffer(i));
    ap->pGraphics = GetMapUnitMMSGfxBuffer(i);

    mapUnitProc->unk_30 = container->layer;
    ap->tileBase = (i * 4) + container->layer + (mapUnitProc->pal & 0xf) * 0x1000 + mapUnitProc->unk_2e;

    mapUnitProc->ap = ap;

    container->pMapUnitProcs[i] = mapUnitProc;

    return i;
}
