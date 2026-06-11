#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

//! FE8U = 0x080AAA6C
void SaveDraw_OnEnd(void)
{
    EndBgVerticalScroll();
    return;
}
