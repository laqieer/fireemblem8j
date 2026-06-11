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

//! FE8U = 0x080AB794
void SaveMenuInitSubBoxText(void)
{
    InitTextFont(
        &gSaveMenuSubBoxFont,
        (void*)BG_VRAM + BGCHR_SAVEMENU_SUBBOX_TEXT * TILE_SIZE_4BPP,
        BGCHR_SAVEMENU_SUBBOX_TEXT,
        BGPAL_SAVEMENU_SUBBOX_TEXT);

    InitText(&gSaveMenuSubBoxText, 10);
}
