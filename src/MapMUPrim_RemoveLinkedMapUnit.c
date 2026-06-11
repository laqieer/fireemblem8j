#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"

//! FE8U = 0x080BD3E8
void MapMUPrim_RemoveLinkedMapUnit(struct GMapMuPrimProc * proc)
{
    if (proc->unk_2b >= 0)
    {
        MapUnitC_DeleteGmapUnit(((struct WorldMapMainProc *)(proc->proc_parent))->gm_unitc, proc->unk_2b);
        proc->unk_2b = -1;
    }

    return;
}
