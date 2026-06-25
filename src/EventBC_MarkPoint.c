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

//! FE8U = 0x0800CADC
u8 EventBC_MarkPoint(struct EventEngineProc * proc)
{
    int p = *(int *)((int)proc + 0x38);

    int a = *(s16 *)(p + 4);
    int pal = *(s16 *)(p + 6);
    int nodeId = *(s16 *)(p + 8);
    int eff = *(s16 *)(p + 10);

    if (!EVENT_IS_SKIPPING(proc))
    {
        s16 x;
        s16 y;
        *&x = nodeId[gWMNodeData].x;
        *&y = nodeId[gWMNodeData].y;
        StartWmPlaceDot(a, pal, x / 2, y / 2, eff, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
