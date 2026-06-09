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







































//! FE8U = 0x0808BBCC
int GetCursorQuadrant(void)
{
    int cursorX;
    int camX;
    int cursorY;
    int camY;

    int x;
    int y;

    cursorX = (gBmSt.playerCursor.x * 16);
    camX = (gBmSt.camera.x - 8);

    x = cursorX - camX;

    cursorY = (gBmSt.playerCursor.y * 16);
    camY = (gBmSt.camera.y - 8);

    y = cursorY - camY;

    if ((x < (DISPLAY_WIDTH / 2) + 1) && (y < (DISPLAY_HEIGHT / 2) + 1))
    {
        return 0;
    }

    if ((x >= (DISPLAY_WIDTH / 2) + 1) && (y < (DISPLAY_HEIGHT / 2) + 1))
    {
        return 1;
    }

    if ((x < (DISPLAY_WIDTH / 2) + 1) && (y >= (DISPLAY_HEIGHT / 2) + 1))
    {
        return 2;
    }

    if ((x >= (DISPLAY_WIDTH / 2) + 1) && (y >= (DISPLAY_HEIGHT / 2) + 1))
    {
        return 3;
    }
}
