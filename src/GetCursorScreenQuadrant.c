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

//! FE8U = 0x0808D1B4
int GetCursorScreenQuadrant(void)
{
    if (IsCursorInLowerScreenHalf())
    {
        if (GetCursorScreenSideX() == -1)
        {
            return 2;
        }

        if (GetCursorScreenSideX() == +1)
        {
            return 1;
        }
    }
    else
    {
        if (GetCursorScreenSideXAlt() == -1)
        {
            return 4;
        }

        if (GetCursorScreenSideXAlt() == +1)
        {
            return 3;
        }
    }

    return 0;
}
