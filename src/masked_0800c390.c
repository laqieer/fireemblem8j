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

//! FE8U = 0x0800C0B8
u8 Event8A_WmShowCursor_Unsure(struct EventEngineProc * proc)
{
    gGMData.sprite_disp = 1;
    return EVC_ADVANCE_CONTINUE;
}
