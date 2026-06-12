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

//! FE8U = 0x0800C924
u8 EventB2_WmFancyFade(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    StartGmapLineFade(a, NULL);

    return EVC_ADVANCE_YIELD;
}
