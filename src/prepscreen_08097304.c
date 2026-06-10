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



int CONST_DATA gPrepscreen_6[][3] =
{
    { 0x57A, 0x57A, 0x75D, },
    { 0x57B, 0x57C, 0x75E, },
    { 0x57D, 0x581,     0, },
    {     0,     0, 0x75F, },
    { 0x57D, 0x57F,     0, },
    {     0,     0,     0, },
    {     0,     0,     0, },
    { 0x580, 0x580,     0, },
    { 0x582, 0x582,     0, },
};

/* prototypes for same-file helpers called by this run */
u8 CanPrepScreenSave(void);

//! FE8U = 0x08095024
int Prep_GetActiveMenuItemTextId(void)
{
    int index = GetActivePrepMenuItemIndex();

    if (CheckInLinkArena())
    {
        return gPrepscreen_6[index][2];
    }

    if (index == 4)
    {
        if (!IsDivinationOptionAvailable(2))
        {
            return gPrepscreen_6[4][0];
        }
    }
    else if (index == 2)
    {
        if (!CanPrepScreenSave())
        {
            return gPrepscreen_6[2][0];
        }
    }

    return gPrepscreen_6[index][1];
}
