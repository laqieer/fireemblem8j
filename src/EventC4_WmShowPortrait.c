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

//! FE8U = 0x0800CC8C
u8 EventC4_WmShowPortrait(struct EventEngineProc * proc)
{
    int p = *(int *)((int)proc + 0x38);

    int face_slot = *(s16 *)(p + 4);
    int fid = *(s16 *)(p + 6);
    int config = *(s16 *)(p + 8);
    int delay = *(s16 *)(p + 10);

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (delay)
    {
        WmMergeFace(delay, 6, face_slot, fid, 0, 0, config);
    }
    else
    {
        WmDrawFace(face_slot, fid, config);
    }

    return EVC_ADVANCE_CONTINUE;
}
