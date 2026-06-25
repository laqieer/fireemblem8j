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

//! FE8U = 0x0800C9A0
u8 EventB6_WmMoveBigMap(struct EventEngineProc * proc)
{
    int p = *(int *)((int)proc + 0x38);

    int x1 = *(s16 *)(p + 4);
    int y1 = *(s16 *)(p + 6);
    int x2 = *(s16 *)(p + 8);
    int y2 = *(s16 *)(p + 10);
    int speed = *(s16 *)(p + 12);
    int delay = *(s16 *)(p + 14);

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartGmapRmUpdateExt(x1, y1, x2, y2, speed, delay, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}
