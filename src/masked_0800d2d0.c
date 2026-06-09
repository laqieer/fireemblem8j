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













void EnqueueEventCall(const u16* events, u8 execType) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    for (i = -1; ++i <= 0xf;) {
        if (!it->isUsed) {
            it->events   = events;
            it->execType = execType;
            it->isUsed   = TRUE;

            break;
        }

        ++it;
    }
}
