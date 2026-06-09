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

//! FE8U = 0x0800CBF0
u8 EventC1_SKIPWM(struct EventEngineProc * proc)
{
    gGMData.state.bits.skip_wm = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC04
u8 EventC2_WmNoFade(struct EventEngineProc * proc)
{
    gGMData.state.bits.no_fade = 1;
    return EVC_ADVANCE_CONTINUE;
}
