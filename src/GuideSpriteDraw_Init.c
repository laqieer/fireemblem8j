#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"

//! FE8U = 0x080CDF78
void GuideSpriteDraw_Init(void)
{
    UnpackUiVArrowGfx(0xe0, 3);
    return;
}
