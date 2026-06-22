#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

void MapMUPrim_MakeUnitForChar(struct GMapMuPrimProc * proc, int pid, int nodeId);
void MapMUPrim_MakeUnitForClass(struct GMapMuPrimProc * proc, int jid, int nodeId);

extern u8 CONST_DATA gGMapMuSpriteLayerLut[];

void GmMu_SetUnit(struct GMapMuProc * muProc, int index, u8 useClassArg, int id, int faction, int nodeId)
{
    int useClass = (s8)useClassArg;
    struct GMapMuPrimProc * muPrimProc = muProc->unk_2c[index];

    if (muPrimProc->unk_2a > -1)
    {
        GmMu_RemoveUnit(muProc, index);
    }

    muPrimProc->unk_2a = index;

    if (useClass != 0)
    {
        MapMUPrim_MakeUnitForClass(muPrimProc, id, nodeId);
        gGMData.units[index].id = id;
        gGMData.units[index].state |= 2;
    }
    else
    {
        MapMUPrim_MakeUnitForChar(muPrimProc, id, nodeId);
        gGMData.units[index].id = id;
        gGMData.units[index].state &= ~2;
    }

    gGMData.units[index].location = nodeId;

    if (faction < 0)
    {
        faction = GetGmUnitFaction(index);
    }

    MapUnitC_SetFaction(((struct WorldMapMainProc *)(muPrimProc->proc_parent))->gm_unitc, muPrimProc->unk_2b, faction);

    muPrimProc->unk_40 = 0;
    muPrimProc->unk_2c = 0;
    muPrimProc->flags_0 = 0;
    muPrimProc->flags_2 = 0;
    muPrimProc->flags_3 = 0;

    GmMu_SetSpriteLayer(muProc, index, gGMapMuSpriteLayerLut[index]);

    return;
}
