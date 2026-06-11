#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"










extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000]; // equipped item icons

// clang-format off











//! FE8U = 0x080901BC
void UnitList_PutHBarSprite(u8 x, u8 y, u8 width)
{
    int i;

    PutSpriteExt(0xd, x, y, gSpriteArray_Unitlistscreen_0[0], OAM2_PAL(5));

    for (i = 0; i < width - 1; i++)
    {
        PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_Unitlistscreen_0[1], OAM2_PAL(5));
    }

    PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_Unitlistscreen_0[2], OAM2_PAL(5));

    return;
}
