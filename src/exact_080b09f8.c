#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"







//! FE8U = 0x080ABF44
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc)
{
    int mask, count = 0;

    for (mask = 1; mask < endMask; mask <<= 1)
    {
        if ((proc->main_options & mask) != 0)
        {
            count++;
        }
    }
    return count;
}
