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

//! FE8U = 0x0800C85C
u8 EventAD_WmFadeToDarker(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        StartGmPalFade_(NULL, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    StartGmPalFade_(NULL, a);
    return EVC_ADVANCE_CONTINUE;
}
