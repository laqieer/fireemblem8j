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

//! FE8U = 0x080CEF10
void Guide_SetBlend(void)
{
    SetBlendAlpha(15, 4);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}
