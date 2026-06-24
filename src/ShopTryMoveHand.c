#include "global.h"
#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"
#include "bmio.h"

#include "constants/songs.h"

int ShopTryMoveHand(int pos, int pre, bool hscroll_en)
{
    int previous;

    if (pos < 0)
        pos = 0;

    if (pos >= pre)
        pos = pre - 1;

    previous = pos;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (pos == 0)
        {
            if (hscroll_en && (gKeyStatusPtr->newKeys & DPAD_UP))
                pos = pre - 1;
        }
        else
        {
            pos--;
        }
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (pos == (pre - 1))
        {
            if (hscroll_en && (gKeyStatusPtr->newKeys & DPAD_DOWN))
                pos = 0;
        }
        else
            pos++;
    }

    if (previous != pos)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }
    return pos;
}
