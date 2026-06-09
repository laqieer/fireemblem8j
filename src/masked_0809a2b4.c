#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

//! FE8U = 0x08097FDC
void ApplyPrepWindowColorPalette(void)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        int pal = gPlaySt.config.windowColor;

        u16* dst = &gPrepscreen_5[i];
        u16* src = &Pal_UnkData_1[pal * 0x10 + i];

        *dst = *src;
    }

    return;
}
