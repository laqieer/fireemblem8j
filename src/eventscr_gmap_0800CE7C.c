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

//! FE8U = 0x0800CBAC
u8 EventBF_(struct EventEngineProc * proc)
{
    WorldMap_PrepareSaveMenu(GM_MAIN);
    WorldMap_TeardownForSubscreen(GM_MAIN);
    Make6C_SaveMenuPostChapter(proc);

    return EVC_ADVANCE_YIELD;
}
