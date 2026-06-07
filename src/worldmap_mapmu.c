#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

#include "constants/classes.h"

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 gWorldmapMapmu_5[];
extern u16 gWorldmapMapmu_6[];
extern u16 gWorldmapMapmu_4[];
extern u16 gWorldmapMapmu_3[];
extern u16 gWorldmapMapmu_7[];
extern u16 gWorldmapMapmu_2[];

extern struct Struct02003BE8 gUnk_15[];

extern u16 gUnk_13[];
extern int gUnk_14[];





//! FE8U = 0x080BD2A8
void GmMuPrim_OnEnd_Null(void)
{
    return;
}

//! FE8U = 0x080BD2AC
int GetCharacterClassId(int pid)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number != pid)
        {
            continue;
        }

        return unit->pClassData->number;
    }

    return gCharacterData[pid - 1].defaultClass;
}

//! FE8U = 0x080BD2EC
void MapMUPrim_MakeUnitForChar(struct GMapMuPrimProc * proc, int pid, int nodeId)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);
        proc->unk_2b = -1;
    }

    proc->unk_2b = NewMapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, GetCharacterClassId(pid), 0);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, nodeId[gWMNodeData].x,
        nodeId[gWMNodeData].y + 6);
    MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 4);
    MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);
    return;
}

//! FE8U = 0x080BD374
void MapMUPrim_MakeUnitForClass(struct GMapMuPrimProc * proc, int jid, int nodeId)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);
        proc->unk_2b = -1;
    }

    proc->unk_2b = NewMapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, jid, 0);

    MapUnitC_SetPosition(
        ((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, nodeId[gWMNodeData].x,
        nodeId[gWMNodeData].y + 6);
    MapUnitC_SetAnimId(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b, 4);
    MapUnitC_SetGfxNeedsUpdate(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);

    return;
}
