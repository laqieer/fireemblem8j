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

//! FE8U = 0x0800CCEC
void Nop_EventscrGmap_0(void)
{
    return;
}

//! FE8U = 0x0800CCF0
u8 EventC5_WmClearPortrait(struct EventEngineProc * proc)
{

    u32 face_slot = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 config = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        EndFaceById(face_slot);
        return EVC_ADVANCE_CONTINUE;
    }

    if (delay)
    {
        WmMergeFace(delay, 7, face_slot, 0, 0, 0, config);
    }
    else
    {
        WmClearFace(face_slot, config);
    }

    return EVC_ADVANCE_CONTINUE;
}
