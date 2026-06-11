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

//! FE8U = 0x0800CDC8
u8 EventC9_RemoveWmText(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        HideWmText();
        return EVC_ADVANCE_CONTINUE;
    }

    HideWmText();

    return EVC_ADVANCE_YIELD;
}
