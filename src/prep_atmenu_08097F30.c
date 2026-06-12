#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

void LoadPrepBannerGfx(int tile, int pal)
{
    /* "Cahpter 0", "Infomaion" */
    Decompress(gUnkData_66, OBJ_VRAM0 + tile);
    ApplyPalette(gPal_SupportScreenBanner, pal + 0x10);
}
