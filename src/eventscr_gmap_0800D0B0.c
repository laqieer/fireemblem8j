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

//! FE8U = 0x0800CDEC
void Nop_EventscrGmap_3(void)
{
    return;
}

//! FE8U = 0x0800CDF0
u8 EventCA_(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CDF4
u8 EventCB_(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}
