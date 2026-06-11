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

void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);
int IsWmPlaceDotActiveAtIndex(int);

//! FE8U = 0x0800C9F0
u8 EventB7_WmBigMapWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        GmapRm_EndAll();
        return EVC_ADVANCE_CONTINUE;
    }

    if (GmapRMExists())
    {
        return EVC_STOP_YIELD;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA18
u8 EventB8_WmShowBigMapHighlight(struct EventEngineProc * proc)
{
    int nation = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (!EVENT_IS_SKIPPING(proc))
    {
        WmShowNationHighlightedMap(nation, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA38
u8 EventB9_WmRemoveHighlightNationPart1(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmapRmBorder1(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    RequestGmapRmBorder1Remove(a);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA60
u8 EventBA_WmRemoveHighlightNationPart2(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        if (GmapRmBorder1Exists(a))
        {
            EndGmapRmBorder1(a);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!GmapRmBorder1Exists(a))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}
