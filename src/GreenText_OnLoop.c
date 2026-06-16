#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void GreenText_OnLoop(void)
{
    u32 index = (GetGameClock() / 4) % 16;
    PAL_BG_COLOR(BGPAL_TEXT_DEFAULT, 14) = *(Pal_GreenTextColors + index);
    EnablePaletteSync();
}
