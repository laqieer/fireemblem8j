#include "global.h"
#include "constants/terrains.h"
#include "bmmap.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "bmlib.h"
#include "bmunit.h"
#include "ctc.h"
#include "minimap.h"
#include "constants/songs.h"

extern u16 *gMinimapObjectFlashPal;

//! FE8U = 0x080ACE28
void InitMinimapFlashPalette() {
    int colorNum;
    int palNum;

    gMinimapObjectFlashPal = (u16 *)gGenericBuffer;

    for (colorNum = 1; colorNum < 16; colorNum++) {
        int color = gPaletteBuffer[BGPAL_OFFSET(4) + colorNum];

        int red = RED_VALUE(color);
        int green = GREEN_VALUE(color);
        int blue = BLUE_VALUE(color);

        for (palNum = 0; palNum < 8; palNum++) {
            gMinimapObjectFlashPal[colorNum + 0x10 * palNum] = ((blue << 10) + (green << 5)) + red;

            red += 3;
            if (red > 31) {
                red = 31;
            }

            green += 3;
            if (green > 31) {
                green = 31;
            }

            blue += 3;
            if (blue > 31) {
                blue = 31;
            }
        }
    }

    return;
}
