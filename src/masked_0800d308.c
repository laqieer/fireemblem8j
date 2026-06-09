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













/* prototypes for same-file helpers called by this run */
struct EventEngineProc* EventEngine_Create(const u16* events, u8 execType);

void CallNextQueuedEvent(void) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    if (it->isUsed == 1)
        EventEngine_Create(it->events, it->execType);

    for (i = 0; i < 15; ++i, ++it)
        *it = *(it + 1);

    it->events   = NULL;
    it->execType = 0;
    it->isUsed   = 0;
}
