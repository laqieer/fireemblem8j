#include "global.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "hardware.h"

extern const u16* sUiFramePaletteLookup[];

void UnpackUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_WINDOW_FRAME;

    ApplyPalette(sUiFramePaletteLookup[gPlaySt.config.windowColor], palId);
}
