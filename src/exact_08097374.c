#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"












 // maybe there is 0xC*sizeof(u16) free space





//! FE8U = 0x08095094
int Prep_GetSupportItemBitIndex(int target, int val)
{
    int i;

    int count = 0;

    for (i = 0; i < 4; i++)
    {
        if (((val >> i) & 1) != 0)
        {
            if (target == count)
            {
                return i;
            }

            count++;
        }
    }

    return -1;
}
