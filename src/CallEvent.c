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

void CallEvent(const u16* events, u8 execType) {
    bool8 found = Proc_Find(ProcScr_StdEventEngine) != 0;

    if (found)
        EnqueueEventCall(events, execType);
    else
        EventEngine_Create(events, execType);
}
