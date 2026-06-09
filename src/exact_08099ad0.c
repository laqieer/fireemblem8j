#include "global.h"

#include "fontgrp.h"
#include "hardware.h"

#include "prepscreen.h"

//! FE8U = 0x080977EC
void PrepSallycir_ClampCursorScroll(u8 * a, u16 * b)
{
    if (gPrepscreen_2 == 0) {
        *a = 0;
        *b = 0;
        return;
    }

    if (gPrepscreen_2 < 8) {
        if (*a >= gPrepscreen_2) {
            *a = gPrepscreen_2 - 1;
        }

        *b = 0;
    } else {
        int unk = (*b >> 4) + 7;

        if (unk < gPrepscreen_2) {
            if (*a != 6) {
                return;
            }

            *a = 5;
            return;
        }

        if (unk <= gPrepscreen_2) {
            return;
        }

        *b = (gPrepscreen_2 - 7) * 16;
    }

    return;
}
