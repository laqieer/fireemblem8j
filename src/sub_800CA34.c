#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"

#include "eventscript.h"
#include "event.h"

//! FE8U = 0x0800C754
u8 EventA9_WmUnitMovePaths(struct EventEngineProc * proc)
{
    struct Sub80C3378 local;
    int p = *(int *)((int)proc + 0x38);

    int wm_uid = *(s16 *)(p + 4);
    int conf = *(u16 *)(p + 6);
    int node1 = *(s16 *)(p + 8);
    int node2 = *(s16 *)(p + 10);
    int speed = *(u16 *)(p + 12);
    int delay = *(u16 *)(p + 14);

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.units[wm_uid].location = node2;

        if ((conf & 2) != 0)
        {
            HideGmUnit(wm_uid);
        }
    }
    else
    {
        local.wm_uid = wm_uid;
        local.unk_01 = 0;
        local.srcNode = node1;
        local.dstNode = node2;
        local.speed = speed;
        local.delay = delay;
        StartGmapAutoMu_Type0(&local, conf, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
