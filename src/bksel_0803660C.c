#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

void InitBattleForecastIconPaletteBuffer(void)
{
    int i;
    int j;

    LoadIconPalette(0, 3);

    for (i = 1; i < 16; ++i) {
        int color = gPaletteBuffer[PAL_COLOR_OFFSET(3, i)];

        int red = RED_VALUE(color);

        int green = GREEN_VALUE(color);

        int blue = BLUE_VALUE(color);

        for (j = 0; j < 8; ++j) {

            gBkselPals[j][i] = ((blue << 10) + (green << 5)) + red;

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
}
