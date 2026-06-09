#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "player_interface.h"

#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

// clang-format off







































//! FE8U = 0x0808C314
int GetCursorScreenSideX(void)
{
    if (((gBmSt.playerCursor.x * 16) - gBmSt.camera.x) < DISPLAY_WIDTH / 2 - 8)
    {
        return +1;
    }
    else
    {
        return -1;
    }
}
