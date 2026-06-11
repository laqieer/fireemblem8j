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

//! FE8U = 0x0800C58C
u8 EventA0_WmRemoveUnit(struct EventEngineProc * proc)
{
    int muId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    RemoveGmUnit(muId);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C59C
u8 EventA1_WmShowUnit(struct EventEngineProc * proc)
{
    int index = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    ShowGmUnit(index);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C5AC
u8 EventA2_WmHideUnit(struct EventEngineProc * proc)
{
    int index = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    HideGmUnit(index);
    return EVC_ADVANCE_CONTINUE;
}
