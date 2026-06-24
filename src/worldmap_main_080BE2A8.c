#include "global.h"

#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"

#include "worldmap.h"

#include "constants/songs.h"

void WmMain_MoveCursor(struct WorldMapMainProc * proc)
{
    s16 xCursorPrev;
    s16 yCursorPrev;
    s16 xCursorNew;
    s16 yCursorNew;
    int keys;
    int duration;
    struct Vec2 pos;

    if (gKeyStatusPtr->heldKeys & B_BUTTON)
    {
        /* If held B button, fasten cursor moving */
        duration = 2;
        proc->delay_timer = 0;
    }
    else
        duration = 4;

    if (proc->delay_timer > 0)
    {
        proc->delay_timer--;
        return;
    }

    if (GmMoveCursorExists())
        return;

    if (gKeyStatusPtr->heldKeys & B_BUTTON)
    {
        keys = gKeyStatusPtr->heldKeys & DPAD_ANY;
        proc->delay_timer = 10;
    }
    else if (gKeyStatusPtr->newKeys & DPAD_ANY)
    {
        proc->delay_timer = 10;
        keys = gKeyStatusPtr->newKeys & DPAD_ANY;
    }
    else
    {
        keys = gKeyStatusPtr->heldKeys & DPAD_ANY;
        proc->delay_timer = 0;
    }

    if (keys == 0)
    {
        return;
    }

    xCursorPrev = ((gGMData.ix >> 8) / 16);
    yCursorPrev = ((gGMData.iy >> 8) / 16);

    xCursorNew = xCursorPrev;
    yCursorNew = yCursorPrev;

    if (keys & DPAD_RIGHT)
        xCursorNew++;
    else if (keys & DPAD_LEFT)
        xCursorNew--;

    if (keys & DPAD_DOWN)
        yCursorNew++;
    else if (keys & DPAD_UP)
        yCursorNew--;

    if (xCursorNew < 1)
        xCursorNew = 1;
    else if (xCursorNew > 28)
        xCursorNew = 28;

    if (yCursorNew < 1)
        yCursorNew = 1;
    else if (yCursorNew > 18)
        yCursorNew = 18;

    if ((xCursorPrev != xCursorNew) || (yCursorPrev != yCursorNew))
    {
        PlaySoundEffect(SONG_65);

        pos.x = xCursorNew * 16 + 8;
        pos.y = yCursorNew * 16 + 8;

        StartGmMoveCursor(0, &pos, duration, 0, proc);
    }
}
