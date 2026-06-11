#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

s8 GetEventTriggerState(u16 triggerId) {
    if (!CheckFlag(triggerId))
        return FALSE;
    return TRUE;
}
